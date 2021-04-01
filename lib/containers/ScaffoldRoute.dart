import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/%20share_provider/test.dart';
import 'package:flutter_study/containers/DrawerTest.dart';
import 'package:flutter_study/event/event_test.dart';
import 'package:flutter_study/scroll/HomeTab.dart';
import 'package:flutter_study/scroll/InfiniteGridView.dart';
import 'package:flutter_study/scroll/ListTest.dart';
import 'package:flutter_study/state/TapBoxC.dart';

import 'MyClipper.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaffoldRouteState();
  }
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  PageController _pageController;
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _pageController = PageController();
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          home(),
          list(),
          // CustomScrollViewTest()
          // TestInheritedWidget()
          // ProviderTest()
          // HttpTestWidget()
          EventTest()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => _pageController.jumpToPage(0),
            ),
            SizedBox(), //中间位置空出
            IconButton(
              icon: Icon(Icons.business),
              onPressed: () => _pageController.jumpToPage(2),
            )
          ],
          //均分底部导航栏的空间
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // BotToast.showText(text: "中间");
          // _pageController.jumpToPage(1);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EventTest();
          }));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget list() {
    Widget avatar = Image.asset(
      "images/avatar.jpg",
      width: 80,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("剪裁"),
      ),
      body: Center(
        child: Column(
          children: [
            //原图
            avatar,
            //剪裁为圆形
            ClipOval(
              child: avatar,
            ),
            //剪裁为圆角矩形
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: avatar,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     //Align：调整子组件的位置，
            //     Align(
            //       alignment: Alignment.topLeft,
            //       widthFactor: .5, //自身的 = 子组件 x widthFactor
            //       child: avatar,
            //     ),
            //     Text(
            //       "Hello World",
            //       style: TextStyle(color: Colors.green),
            //     )
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     // 将溢出的部分剪裁
            //     ClipRect(
            //       child: Align(
            //         alignment: Alignment.topLeft,
            //         widthFactor: .5,
            //         child: avatar,
            //       ),
            //     ),
            //     Text(
            //       "Hello World",
            //       style: TextStyle(color: Colors.green),
            //     )
            //   ],
            // ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: ClipRect(
                child: avatar,
                clipper: MyClipper(),
              ),
            ),
            SizedBox(height: 20),
            ParentWidget()
          ],
        ),
      ),
    );
  }

  Widget home() {
    return Scaffold(
      drawer: Drawer(
        child: DrawerTest(),
      ),
      appBar: AppBar(
        title: Text("App"),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: () => {Scaffold.of(context).openDrawer()},
          );
        }),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => {},
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Text(e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [SingleChildScrollViewTest(), ListTest(), InfiniteGridView()],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _add() {}
}
