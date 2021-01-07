import 'dart:async';
import 'dart:io';

void main() {
  print("start ----------->");

  getNetData().then((value) => print(value));

  print("end -------------->");
}

Future<String> getNetData() async {
  var result1 = await Future.delayed(Duration(seconds: 3), () {
    return "网络数据1";
  });
  var result2 = await Future.delayed(Duration(seconds: 3), () {
    return "网络数据2";
  });
  return result1 + "-----" + result2;
}
