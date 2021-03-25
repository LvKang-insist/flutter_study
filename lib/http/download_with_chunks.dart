import 'dart:io';

import 'package:dio/dio.dart';

Future downloadWithChunks(url, savePath,
    {ProgressCallback onReceiveProgress}) async {
  //第一次数据块大小
  const firstChunkSize = 102;
  const maxChunk = 3;

  int total = 0;
  var dio = Dio();
  var progress = <int>[];

  createCallback(no) {
    return (int received, _) {
      progress[no] = received;
      if (onReceiveProgress != null && total != 0) {
        onReceiveProgress(progress.reduce((a, b) => a + b), total);
      }
    };
  }

  // start:当前块起始位置，end 代表结束位置
  Future<Response> downloadChunk(url, start, end, no) async {
    //progress 记录每一个块已接收的数据长度
    progress.add(0);
    --end;
    return dio.download(
      url,
      //临时文件按照块的序号命名，方便最后合并
      savePath + "temp$no",
      //创建进度回调
      onReceiveProgress: createCallback(no),
      options: Options(
        //header 中指定请求区间
        headers: {"range": "bytes=$start-$end"},
      ),
    );
  }

  Future mergeTempFiles(chunk) async {
    File f = File(savePath + "temp0");
    IOSink ioSink= f.openWrite(mode: FileMode.writeOnlyAppend);
    //合并临时文件
    for (int i = 1; i < chunk; ++i) {
      File _f = File(savePath + "temp$i");
      await ioSink.addStream(_f.openRead());
      //删除临时文件
      await _f.delete();
    }
    await ioSink.close();
    //合并后的文件重命名为真正的名称
    await f.rename(savePath);
  }

  //通过第一个分块请求检测服务器是否支持分块传输
  Response response = await downloadChunk(url, 0, firstChunkSize, 0);
  //如果有
  if (response.statusCode == 206) {
    //解析文件总长度，进而算出剩余长度
    total = int.parse(
        response.headers.value(HttpHeaders.contentRangeHeader).split("/").last);
    //剩余长度
    int reserved = total -
        int.parse(response.headers.value(HttpHeaders.contentLengthHeader));
    //计算总块数(包括第一块)
    int chunk = (reserved / firstChunkSize).ceil() + 1;
    if (chunk > 1) {
      int chunkSize = firstChunkSize;
      if (chunk > maxChunk + 1) {
        chunk = maxChunk + 1;
        //每个块的大小
        chunkSize = (reserved / maxChunk).ceil();
      }
      var futures = <Future>[];
      for (int i = 0; i < maxChunk; ++i) {
        //当前请求的开始位置
        int start = firstChunkSize + i * chunkSize;
        //分块下载文件
        futures.add(downloadChunk(url, start, start + chunkSize, i + 1));
      }
      //等待所有分块全部下载完成
      await Future.wait(futures);
    }
    //合并文件
    await mergeTempFiles(chunk);
  }

}
