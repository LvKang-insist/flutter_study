import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchAndCheckboxTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchAndCheckboxTest();
  }
}

class _SwitchAndCheckboxTest extends State<SwitchAndCheckboxTest> {
  bool _switchSelected = true; //单选状态
  bool _checkboxSelected = true; //复选框状态
  var groupValue = 0; //单选框，默认选中的值
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选开关和复选框"),
      ),
      body: Column(
        children: [
          Switch(
            value: _switchSelected,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.red,
            onChanged: (value) => setState(() => _checkboxSelected = value),
          ),
          Row(
            children: [
              Radio(
                activeColor: Colors.red,
                //此单选框绑定的值
                value: 0,
                //点击状态改变的回调
                onChanged: (value) => setState(() => this.groupValue = value),
                //当前组件中选定的值
                groupValue: groupValue,
              ),
              Radio(
                //此单选框绑定的值
                activeColor: Colors.red,
                value: 1,
                //点击状态改变的回调
                onChanged: (value) => setState(() => this.groupValue = value),
                //当前组件中选定的值
                groupValue: groupValue,
              ),
              Radio(
                activeColor: Colors.red,
                //此单选框绑定的值
                value: 2,
                //点击状态改变的回调
                onChanged: (value) => setState(() => this.groupValue = value),
                //当前组件中选定的值
                groupValue: groupValue,
              )
            ],
          )
        ],
      ),
    );
  }
}
