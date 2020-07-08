import 'package:flutter/material.dart';

class MePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _MePageState();
}

class _MePageState extends State<MePage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('我的'),
          actions: <Widget>[
            new Container(

            )
          ],
        ),
        body: new Center(
          child: null,
        ),

      ),
    );
  }

}