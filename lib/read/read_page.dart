import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';





///界面的主题结构
class ReadPage extends StatefulWidget{
  @override
  State <StatefulWidget>  createState() => new _readPageState();
}
class  _readPageState extends State <ReadPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
            title: new Text("读书"),
            actions: <Widget>[]
        ),
        body: RandomWords(),
      ),
    );
  }
}

///自定义列表
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/
        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  	    @override
        State<RandomWords> createState() => _RandomWordsState();
   }




