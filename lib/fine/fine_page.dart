import 'package:flutter/material.dart';



class FinePage extends StatefulWidget{
  @override
  State <StatefulWidget>  createState() => new _finePageState();
}

class  _finePageState extends State <FinePage> with SingleTickerProviderStateMixin {

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
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.red),
          child: Text(
            '声明布局',
              textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blue),
          ),
        ),
      ),
    );
  }



}