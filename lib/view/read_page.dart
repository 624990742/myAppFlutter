import 'package:flutter/material.dart';
import 'package:my_app/view/short_video_page.dart';

///界面的主题结构
class ReadPage extends StatefulWidget{
  @override
  State <StatefulWidget>  createState() => new _readPageState();
}

class  _readPageState extends State <ReadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShortVideoPage(),
    );
  }
}







