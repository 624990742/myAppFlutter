import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  @override
 Widget build(BuildContext context){

    return  MaterialApp(
      title: '测试Row与Clomu的区别',
      home: Scaffold(
           appBar: new AppBar(
             title: new Text('测试的啊'),
           ),
        body: new Center(
          child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               new Expanded(
                 flex: 3,
                 child: new Image.asset('images/fengjing1.jpg'),
               ),

               new Expanded(
                 flex: 5,
                 child: new Image.asset('images/headerBg.png'),
               ),

               new Expanded(
                 flex: 3,
                 child: new Image.asset('images/fengjing2.jpeg'),
               ),

             ],
          ),

        ),

      ),

    );

}

}




class _MyHomePageState extends State <MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //...

    var ratings = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
            ],
          ),
          new Text(
            '170 Reviews',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
    //...
  }
}




//    return  MaterialApp(
//      title: '测试第一个demo',
//      home: Scaffold(
//        appBar: new AppBar(
//          title: new Text("首页"),
//        ),
//          body: new ListView(children: [
//            new  Image.asset(
//              'images/headerBg.png',
//              width: 600.0,
//              height: 240.0,
//              fit: BoxFit.cover,
//            ),
//            titleSection,
//            buttonSection,
//            textSection,
//          ],
//        ),
//      ),
//    );









/********* 第一个实战demo ***********/
//void main() => runApp(new MyApp());
//class MyApp extends StatelessWidget  {
//
//  @override
//  Widget build(BuildContext context) {
//
//    Column  buildButtonColum(IconData icon, String label){
//      Color color = Theme.of(context).primaryColor;
//
//       return new Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           new Icon(icon, color: color,),
//           new Container(
//             margin: const EdgeInsets.only(top: 8.0),
//             child: new Text(
//               label,
//               style: new TextStyle(
//                 fontSize: 12.0,
//                 fontWeight: FontWeight.w400,
//                 color: color,
//               ),
//             ),
//           ),
//         ],
//       );
//    }
//
//
//
//    Widget  buttonSection = new Container(
//      child: new Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: [
//          buildButtonColum(Icons.call, 'CALL'),
//          buildButtonColum(Icons.near_me, 'ROUTE'),
//          buildButtonColum(Icons.share, 'SHARE'),
//          buildButtonColum(Icons.pan_tool, 'HAND')
//        ],
//      ),
//    );
//
//
//
//    Widget textSection = new Container(
//      padding: const EdgeInsets.all(32.0),
//      child: new Text(
//          '''
//Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
//        ''',
//        softWrap: true,
//      ),
//
//    );
//
//
//
//    Widget titleSection = new Container(
//      padding: const EdgeInsets.all(32.0),
//      child: new Row(
//        children: [
//          new Expanded(
//            child: new Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                new Container(
//                  padding: const EdgeInsets.only(bottom: 8.0),
//                  child: new Text(
//                    '你好啊，就是测试',
//                    style: new TextStyle(
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ),
//                new Text(
//                    '嘻嘻哈哈',
//                  style: new TextStyle(
//                    color: Colors.grey[500],
//                  ),
//                ),
//              ],
//            ),
//          ),
//          new Icon(
//            Icons.star,
//            color: Colors.red[500],
//          ),
//          new Text('34')
//        ],
//      ),
//    );
//
//
//    return  MaterialApp(
//      title: '测试第一个demo',
//      home: Scaffold(
//        appBar: new AppBar(
//          title: new Text("首页"),
//        ),
//          body: new ListView(children: [
//            new  Image.asset(
//              'images/headerBg.png',
//              width: 600.0,
//              height: 240.0,
//              fit: BoxFit.cover,
//            ),
//            titleSection,
//            buttonSection,
//            textSection,
//          ],
//        ),
//      ),
//    );
//
//     }
//}
//
//







/********* 第一个Flutter 小demo ***********/
//void main() => runApp(new MyApp());
//class MyApp extends StatelessWidget  {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: '测试Flutter',
//      theme: new ThemeData(
//        primaryColor: Colors.white,
//      ),
//      home:  new RandomWords()
//    );
//  }
//}
//
//
//class RandomWords extends StatefulWidget {
//  @override
//  createState() => new RandomWordsState();
//  }
//
//
//class RandomWordsState extends State<RandomWords> {
//  final _suggestions = <WordPair>[];
//  final _saved = new Set<WordPair>();
//  final _biggerFont = const TextStyle(fontSize: 20.0);
//
//
//  Widget _buildSuggestions() {
//    return new ListView.builder(
//      padding: const EdgeInsets.all(16.0),
//     itemBuilder: (context,i) {
//        if (i.isOdd) return new Divider();
//        final index = i ~/ 2;
//        if(index >= _suggestions.length){
//          _suggestions.addAll(generateWordPairs().take(10));
//        }
//        return _buildRow(_suggestions[index]);
//     }
//    );
//  }
//
//  Widget _buildRow(WordPair pair) {
//    final alreadySaved = _saved.contains(pair);
//    return new ListTile(
//      title: new Text(
//        pair.asPascalCase,
//        style: _biggerFont,
//      ),
//      trailing: new Icon(
//        alreadySaved ? Icons.favorite : Icons.favorite_border,
//        color: alreadySaved ? Colors.red : null,
//      ),
//      onTap: () {
//        setState(() {
//          if(alreadySaved){
//            _saved.remove(pair);
//          } else {
//            _saved.add(pair);
//          }
//        });
//
//      },
//    );
//  }
//
//
//  void _pushSaved() {
//    Navigator.of(context).push(
//      new MaterialPageRoute(
//        builder: (context) {
//          final tiles = _saved.map(
//                (pair) {
//              return new ListTile(
//                title: new Text(
//                  pair.asPascalCase,
//                  style: _biggerFont,
//                ),
//              );
//            },
//          );
//          final divided = ListTile
//              .divideTiles(
//            context: context,
//            tiles: tiles,
//          )
//              .toList();
//
//          return new Scaffold(
//            appBar: new AppBar(
//              title: new Text("第二页"),
//            ),
//             body: new ListView(children: divided),
//          );
//        },
//      ),
//    );
//  }
//
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('我的第一个Flutter项目'),
//        actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
//        ],
//      ),
//      body: _buildSuggestions(),
//    );
//  }
//}
//
//





