import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ComponentDemoPage extends StatefulWidget {
  final String title;
  const ComponentDemoPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _ComponentDemoPageState();
}

class _ComponentDemoPageState extends State<ComponentDemoPage> {

  String _message = "你还没有点击按钮";
  TextStyle blackStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black); // 黑色样式
  TextStyle redStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red); // 红色样式

  late TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("提示"),
            content: Text("你点击了 Flutter"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("确定"),
              ),
            ],
          ),
        );
      };
  }

  @override
  void dispose() {
    _tapRecognizer.dispose(); // 释放资源
    super.dispose();
  }

  void _handleButtonClick(String label) {
    setState(() {
      _message = "你点击了：$label";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("富文本 & 按钮示例")),
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // 避免超出
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ✅ 修复后的富文本 RichText 示例
              RichText(
                text: TextSpan(
                  text: '我是 ',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: <TextSpan>[
                    TextSpan(
                      text: '90后晨仔 ',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      recognizer: _tapRecognizer, // 👈 正确位置
                    ),
                    TextSpan(
                      text: 'come on!',
                      style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Text("点击按钮演示：", style: TextStyle(fontSize: 16)),
              SizedBox(height: 30),

              /// ✅ 富文本段落示例
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: '文本是视图系统中常见的控件，它用来显示一段特定样式的字符串，类似', style: redStyle),
                    TextSpan(text: 'iOS', style: blackStyle),
                    TextSpan(text: '中的', style: redStyle),
                    TextSpan(text: 'UILabel', style: blackStyle),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),

              /// ✅ 按钮示例
              ElevatedButton(
                onPressed: () => _handleButtonClick("ElevatedButton"),
                child: Text("ElevatedButton"),
              ),
              TextButton(
                onPressed: () => _handleButtonClick("TextButton"),
                child: Text("TextButton"),
              ),
              OutlinedButton(
                onPressed: () => _handleButtonClick("OutlinedButton"),
                child: Text("OutlinedButton"),
              ),
              IconButton(
                onPressed: () => _handleButtonClick("IconButton"),
                icon: Icon(Icons.favorite, color: Colors.pink),
              ),

              SizedBox(height: 20),

              /// ✅ 显示点击结果
              Text(
                _message,
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}