import 'package:flutter/material.dart';



class FinePage extends StatefulWidget{
  @override
  State <StatefulWidget>  createState() => new _finePageState();
}


class  _finePageState extends State <FinePage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    throw UnimplementedError();
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("发现"),
          actions: <Widget>[],
        ),
      ),
    );
  }



}