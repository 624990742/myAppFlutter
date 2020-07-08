import 'package:flutter/material.dart';

class ReadPage extends StatefulWidget{
  @override
  State <StatefulWidget>  createState() => new _readPageState();
}


class  _readPageState extends State <ReadPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    throw UnimplementedError();
  return new MaterialApp(
     home: new Scaffold(
       appBar: new AppBar(
         title: new Text("读书"),
         actions: <Widget>[],
       ),
     ),
    );
  }



}
