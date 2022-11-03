import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_app/tabbar/navigation_tabbar.dart';
import 'package:my_app/home/home_page.dart';
import 'package:my_app/read/read_page.dart';
import 'package:my_app/fine/fine_page.dart';
import 'package:my_app/me/me_page.dart';


class PageIndex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PageIndexState();
}

class _PageIndexState extends State <PageIndex> with TickerProviderStateMixin {
   int _currentInedx = 0;//当前界面的索引值
   List<TabbarIocnView>  _tabbarIconViews;//底部工具栏所有的 tabbarItem
   List<StatefulWidget> _pageList;//item 对应的界面
   StatefulWidget _currentPage;//当前的显示界面

   //定义一个空的设置状态值的方法
   void _rebuild(){
     setState(() {});
   }

   @override
   void initState(){
     super.initState();
     _tabbarIconViews = <TabbarIocnView>[
       new TabbarIocnView(icon: new Icon(Icons.assessment), itemTitle: "首页",vsync: this),
       new TabbarIocnView(icon: new Icon(Icons.contact_phone), itemTitle: "学单词", vsync: this),
       new TabbarIocnView(icon: new Icon(Icons.contacts), itemTitle: "发现", vsync: this),
       new TabbarIocnView(icon: new Icon(Icons.face), itemTitle: "我", vsync: this),
     ];

     //给每一个按钮区域上加监听
     for(TabbarIocnView itemBar in _tabbarIconViews) {
       itemBar.controller.addListener(_rebuild);
     }

     //将我们 bottomBar 上面的按钮图标对应的页面存放起来
     _pageList = <StatefulWidget>[
       new HomePage(),
       new ReadPage(),
       new FinePage(),
       new MePage()
     ];
     _currentPage = _pageList[_currentInedx];

   }




  @override
  Widget build(BuildContext context) {
//     TODO: implement build
//    throw UnimplementedError();
   final  BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
       items: _tabbarIconViews
       .map((TabbarIocnView tbbarIocnView) => tbbarIocnView.barItem).toList(),//添加 icon 按钮
      currentIndex: _currentInedx, // 当前点击的索引值
     type: BottomNavigationBarType.fixed, // 设置底部导航工具栏的类型：fixed 固定
     onTap: (int index){//点击事件
         setState(() {//点击之后，需要出发的逻辑事件
           _tabbarIconViews[_currentInedx].controller.reverse();
           _currentInedx = index;
           _tabbarIconViews[_currentInedx].controller.forward();
           _currentPage = _pageList[_currentInedx];
         });
     },
   );


    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
           child: _currentPage,//当前选中的界面索引值
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    theme: new ThemeData(
      primarySwatch: Colors.blue,//设置主题颜色
    ),
    );
  }

}


