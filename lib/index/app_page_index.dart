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
       new TabbarIocnView(icon: new Icon(Icons.assessment), itemTitle: new Text("首页"),vsync: this),
       new TabbarIocnView(icon: new Icon(Icons.contact_phone), itemTitle: new Text("读书"), vsync: this),
       new TabbarIocnView(icon: new Icon(Icons.contacts), itemTitle:  new Text("发现"), vsync: this),
       new TabbarIocnView(icon: new Icon(Icons.face), itemTitle: new Text("我"), vsync: this),
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
//           child: ,//当前选中的界面索引值
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    theme: new ThemeData(
      primarySwatch: Colors.blue,//设置主题颜色
    ),
    );
  }

}




//import 'dart:math';
//import 'package:flutter/cupertino.dart';
//import 'package:english_words/english_words.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;

//void main() => runApp(new MyApp());
//class MyApp extends StatelessWidget  {
//
//  @override
//  Widget build(BuildContext context) {
//
//    Column  buildButtonColum(IconData icon, String label){
//      Color color = Theme.of(context).primaryColor;
//
//      return  new Column(
//        mainAxisSize: MainAxisSize.min,
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          new Icon(icon, color: color,),
//          new Container(
//            margin: const EdgeInsets.only(top: 8.0),
//            child: new Text(
//              label,
//              style: new TextStyle(
//                fontSize: 12.0,
//                fontWeight: FontWeight.w400,
//                color: color,
//              ),
//            ),
//          ),
//        ],
//      );
//    }
//
//
//
//    Widget  buttonSection = new Container(
//      child: new Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: [
//          InkWell(
//            child: buildButtonColum(Icons.call, 'CALL'),
//            onTap:(){
//              print('CALL');
//            },
//          ),
//          GestureDetector(
//            child: buildButtonColum(Icons.near_me, 'ROUTE'),
//            onTap: (){
//              print('ROUTE');
//            },
//          ),
//
//
//          RaisedButton(
//            child: buildButtonColum(Icons.near_me, 'SHARE'),
//            onPressed: (){
//              print('SHARE');
//            },
//          ),
//
//
//          InkWell(
//            child: buildButtonColum(Icons.pan_tool, 'HAND'),
//            onTap:(){
//              print('HAND');
//            },
//          ),
//
//        ],
//      ),
//    );
//
//
//
//    Widget textSection = new Container(
//      padding: const EdgeInsets.all(32.0),
//      child: new Text(
//        '''
//Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
//        ''',
//        softWrap: true,
//      ),
//
//    );
//
//
//
//    Widget titleSection = new Container(
//      padding: const EdgeInsets.all(32.0),
//      child: new Row(
//        children: [
//          new Expanded(
//            child: new Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                new Container(
//                  padding: const EdgeInsets.only(bottom: 8.0),
//                  child: new Text(
//                    '你好啊，就是测试',
//                    style: new TextStyle(
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ),
//                new Text(
//                  '嘻嘻哈哈',
//                  style: new TextStyle(
//                    color: Colors.grey[500],
//                  ),
//                ),
//              ],
//            ),
//          ),
//          new Icon(
//            Icons.star,
//            color: Colors.red[500],
//          ),
//          new Text('34')
//        ],
//      ),
//    );
//
//
//    return  MaterialApp(
//      title: '测试第一个demo',
//      home: Scaffold(
//        appBar: new AppBar(
//          title: new Text("首页"),
//        ),
//        body: new ListView(children: [
//          new  Image.asset(
//            'images/headerBg.png',
//            width: 600.0,
//            height: 240.0,
//            fit: BoxFit.cover,
//          ),
//          titleSection,
//          buttonSection,
//          textSection,
//        ],
//        ),
//      ),
//    );
//
//  }
//}

