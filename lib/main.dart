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

  /*
  随机生成一个字符串
class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
    // TODO: implement build
    throw UnimplementedError();
  }
}
*/






class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 20.0);


  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
     itemBuilder: (context,i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
     }
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('就是玩一下'),
//      ),
      body: _buildSuggestions(),
    );
  }

}






