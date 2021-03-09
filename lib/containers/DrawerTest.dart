import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部，默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
                      child: Image.asset(
                        "images/icon.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "文档",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
