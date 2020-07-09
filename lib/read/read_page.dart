import 'package:english_words/english_words.dart';
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

    //在Dart语言中使用下划线前缀标识符，会强制其变成私有的
    final  _suggestions = <WordPair>[];
    final  _biggerFont = const TextStyle(fontSize: 18.0);

    Widget _buildRow(WordPair pair){
      return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    }


    Widget _buildSuggestions() {
        return new ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            //每一列之前添加1像素的分割线
            if(i.isOdd) return  new Divider();
            final index = i ~/ 2;
            if(index >= _suggestions.length){
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return  _buildRow(_suggestions[index]);
          },
        );
    }






  return new MaterialApp(
     home: new Scaffold(
       appBar: new AppBar(
         title: new Text("读书"),
         actions: <Widget>[],
       ),
       body: _buildSuggestions(),
     ),
    );
  }



}
