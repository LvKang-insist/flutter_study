import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'download_with_chunks.dart';

class HttpTestWidget extends StatefulWidget {
  @override
  _HttpTestWidgetState createState() => _HttpTestWidgetState();
}

class _HttpTestWidgetState extends State<HttpTestWidget> {
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          RaisedButton(
            child: Text("下载"),
            onPressed: download,
          ),
          FutureBuilder(
            future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //请求完成
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                if (snapshot.hasError) {
                  return Text("发生错误");
                }
                return Expanded(
                  child: ListView(
                    children: response.data
                        .map<Widget>(
                            (e) => ListTile(title: Text(e["full_name"])))
                        .toList(),
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }

  void download() async {
    var url = "https://download.dcloud.net.cn/HBuilder.9.0.2.macosx_64.dmg";
    var savePath = "/HBuilder.9.0.2.macosx_64.dmg";
    await downloadWithChunks(url, savePath, onReceiveProgress: (received, total) {
      if (total != -1) {
        print("${(received / total * 100).floor()}%");
      }
    });
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (value) {
      return value;
    });
  }

  Future<String> requestData() async {
    return Future.delayed(Duration(seconds: 2), () => null);
  }

  Future<String> request() async {
    //创建 HttpClient
    HttpClient httpClient = HttpClient();

    //打开连接
    HttpClientRequest request =
        await httpClient.getUrl(Uri.parse("https://www.baidu.com"));

    //使用iPhone的UA
    request.headers.add("user-agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");

    //等待连接服务器
    HttpClientResponse response = await request.close();
    //获取响应内容
    var str = response.transform(utf8.decoder).join();
    httpClient.close();
    return str;
  }
}
