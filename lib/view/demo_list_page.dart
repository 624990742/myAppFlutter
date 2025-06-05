import 'package:flutter/material.dart';
import '../alearn_demo/buttonAndRichText_demo/component_demo_page.dart';
import 'package:my_app/alearn_demo/scrollview_demo/scrollview_demo_page.dart'; // 示例，你可以创建更多自定义 Demo 页面类

class DemoListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DemoListPageState();
}

class _DemoListPageState extends State<DemoListPage> {
  List<String> demoTitles = ['富文本和按钮', 'Scrollview'];

  // 映射标题 -> 对应页面
  final Map<String, WidgetBuilder> demoRoutes = {
    '富文本和按钮': (context) => ComponentDemoPage(title: '富文本和按钮'),
    'Scrollview': (context) => ScrollviewDemoPage(title: 'Scrollview'),

  };

  void _addDemo() {
    setState(() {
      int newIndex = demoTitles.length + 1;
      String newTitle = 'Demo $newIndex';
      demoTitles.add(newTitle);
      // 默认添加一个简单 DemoPage，可以根据需要替换
      demoRoutes[newTitle] = (context) => DemoPage(title: newTitle);
    });
  }

  void _navigateToDemo(String title) {
    final builder = demoRoutes[title];
    if (builder != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: builder),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('未找到 "$title" 对应的页面')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo 列表")),
      body: ListView.builder(
        itemCount: demoTitles.length,
        itemBuilder: (context, index) {
          final title = demoTitles[index];
          return ListTile(
            title: Text(title),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => _navigateToDemo(title),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDemo,
        child: Icon(Icons.add),
        tooltip: "添加 Demo",
      ),
    );
  }
}

// 默认 Demo 页面（可保留，也可删）
class DemoPage extends StatelessWidget {
  final String title;

  const DemoPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('你正在浏览 $title')),
    );
  }
}