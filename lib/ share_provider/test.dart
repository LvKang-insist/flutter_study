import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/%20share_provider/change_notifier_provider.dart';

import 'consumer.dart';

///Item类，用于表示商品的信息
class Item {
  final price;
  int count;

  Item(this.price, this.count);
}

class CarMode extends ChangeNotifier {
  //用户保存购物车中商品列表
  final List<Item> _items = [];

  //禁止修改购物车里的商品信息
  UnmodifiableListView get items => UnmodifiableListView(_items);

  //购物车商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  void add(Item item) {
    _items.add(item);
    //通知监听器(观察者)，重新构建 InheritedProvider，更新状态
    notifyListeners();
  }
}

class ProviderTest extends StatefulWidget {
  @override
  _ProviderTestState createState() => _ProviderTestState();
}

class _ProviderTestState extends State<ProviderTest> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: ChangeNotifierProvider(
          data: CarMode(),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Consumer<CarMode>(
                    builder: (context, cart) => Text("总价：${cart.totalPrice}"),
                  ),
                  Builder(
                    builder: (context) {
                      print('添加商品');
                      return RaisedButton(
                        child: Text("添加商品"),
                        onPressed: () {
                          ChangeNotifierProvider.of<CarMode>(context,listen: false)
                              .add(Item(20, 1));
                        },
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      print('测试1');
                      ChangeNotifierProvider.of<CarMode>(context);
                      return Text("测试1");
                    },
                  ),
                  Builder(
                    builder: (context) {
                      print('测试2');
                      return Text("测试2");
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
