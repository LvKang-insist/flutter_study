import 'download_with_chunks.dart';

main() async {
  var url = "https://download.dcloud.net.cn/HBuilder.9.0.2.macosx_64.dmg";
  var savePath = "/HBuilder.9.0.2.macosx_64.dmg";
  await downloadWithChunks(url, savePath, onReceiveProgress: (received, total) {
    if (total != -1) {
      print("${(received / total * 100).floor()}%");
    }
  });
}
