import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

  class  MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
//       final wordPair = new WordPair.random();
      return new MaterialApp(
        title: '我是一个屌丝，我不怕输',

        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('这是第一个Flutter 项目'),
          ),
          body: new Center(
//             child: new Text('我就是我')
           child: RandomWords(),
          ),
        ),
      );
    }
  }

//定义了一个有状态控件，继承自StatefulWidget
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();  //为StatefulWidget控件RandomWords定义一个状态类
}

//定义了一个状态控件，继承自状态类State<RandomWords>，<RandomWords>指明这个状态控件是RandomWords控件的
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}


