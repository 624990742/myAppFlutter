//import 'dart:math';
//import 'package:flutter/cupertino.dart';
//import 'package:english_words/english_words.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_app/alearn_demo/buttonAndRichText_demo/component_demo_page.dart';
import 'package:my_app/view/demo_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}
class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    throw UnimplementedError();

        Column  buildButtonColum(IconData icon, String label) {
          Color color = Theme
              .of(context)
              .primaryColor;

          return new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Icon(icon, color: color,),
              new Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: new Text(
                  label,
                  style: new TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
              ),
            ],
          );
        }

   //标题板块
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    '你好啊，就是测试',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  '嘻嘻哈哈',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('34')
        ],
      ),
    );


   //文本板块
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake  lies at the foot of the  in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from , followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),

    );



    //button 板块
    Widget  buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: buildButtonColum(Icons.call, 'CALL'),
            onTap:(){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DemoListPage())
              );
              print('CALL');
            },
          ),
          GestureDetector(
            child: buildButtonColum(Icons.near_me, 'ROUTE'),
            onTap: (){
              print('ROUTE');
            },
          ),

          ElevatedButton(
            child: buildButtonColum(Icons.near_me, 'SHARE'),
            onPressed: (){
              print('SHARE');
            },
          ),


          InkWell(
            child: buildButtonColum(Icons.pan_tool, 'HAND'),
            onTap:(){
              print('HAND');
            },
          ),

        ],
      ),
    );




    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("首页"),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              'images/headerBg.png',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
          ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),

    );
  }
}
