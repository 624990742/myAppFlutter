import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: '测试Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('开发者'),
        ),
        body: new Center(
//          child: new Text('Hello World'),
           child: new RandomWords(),
        ),
      ),
    );
  }
}



class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();


  }

class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
    // TODO: implement build
    throw UnimplementedError();
  }

}
  