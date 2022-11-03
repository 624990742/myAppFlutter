import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

///界面的主题结构
class ReadPage extends StatefulWidget{
  @override
  State <StatefulWidget>  createState() => new _readPageState();
}

class _readPageState extends State <ReadPage> {
  //单词列表
  final List<WordPair> _suggestions = <WordPair>[];
  //保存状态
  final Set<WordPair> _save = new Set<WordPair>();
  //字体样式
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
            centerTitle: true,
            title: new Text("学单词"),
            actions: <Widget>[
              new IconButton(
                  onPressed: _pushSavedListPage, icon: const Icon(Icons.list))
            ]
        ),
        body: _buildListView(),
      ),
    );
  }

  /**
   * 自定义列表
   */
  Widget _buildListView() {
   return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/
        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  /**
   * 自定义row的样式
   */
  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _save.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.orange : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            print("移除");
            _save.remove(pair);
          } else {
            print("添加");
            _save.add(pair);
          }
        });
      },
    );
  }

  /**
   * push收藏列表界面
   */
  void _pushSavedListPage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _save.map(
                (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}







