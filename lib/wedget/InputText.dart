import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputText();
  }
}

class _InputText extends State<InputText> {
  //定义一个controller
  TextEditingController _nameController = TextEditingController();

  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() => print("账号：" + _nameController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("输入框"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidate: true, //开启自动校验
            child: Column(
              children: [
                TextFormField(
                  autocorrect: true,
                  maxLength: 11,
                  controller: _nameController,
                  decoration: InputDecoration.collapsed(hintText: "用户名或邮箱"),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  decoration: InputDecoration.collapsed(hintText: "您的登录密码"),
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Row(
                    children: [
                      Expanded(
                        child: Builder(builder: (context) {
                          return RaisedButton(
                            padding: EdgeInsets.all(15),
                            child: Text("登录"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              //获取 formState ，调用 validate 验证合法性，
                              if ((Form.of(context)).validate()) {
                                print('验证成功');
                              }
                            },
                          );
                        }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
