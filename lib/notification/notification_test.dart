import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/notification/custom_notification.dart';

class NotificationTest extends StatefulWidget {
  @override
  _NotificationTestState createState() => _NotificationTestState();
}

class _NotificationTestState extends State<NotificationTest> {
  var _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("通知测试")),
      body: NotificationListener<CustomNotification>(
        onNotification: (notification) {
          print(notification.msg);
          return false;
        },
        child: NotificationListener<CustomNotification>(
          onNotification: (notification) {
            setState(() {
              _msg += notification.msg;
            });
            return true;
          },
          child: Center(
            child: Column(
              children: [
                Builder(builder: (context) {
                  return RaisedButton(
                      onPressed: () =>
                          CustomNotification("Hello world").dispatch(context),
                      child: Text("发送通知"));
                }),
                Text(_msg)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
