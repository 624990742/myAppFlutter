import 'package:flutter/material.dart';
import 'package:my_app/alearn_demo/router_demo/router.dart';

class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.green,
                  child: CircleAvatar(
                    radius: 50,
                    //网络头像
                    //NetworkImage("https://xxxxxxxx"),
                    backgroundImage: AssetImage("images/headerBg.png"),
                    backgroundColor: Colors.cyan[100],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '码农晨仔',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '微信号：chenzai520',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "",//这里写头像的网络URL
                    width: 50, // 限制宽度
                    height: 50, // 限制高度
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error, color: Colors.white);
                    },
                  ),
                ),
              ],
            ),
          ),
          _buildMenuItem(Icons.message, '微信支付'),
          _buildMenuItem(Icons.settings, '收藏'),
          _buildMenuItem(Icons.person, '相册'),
          _buildMenuItem(Icons.wallet_travel, '卡包'),
          _buildMenuItem(Icons.location_on, '表情'),
          _buildMenuItem(Icons.search, '设置'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.blue),
          title: Text(title, style: TextStyle(fontSize: 18)),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // 可添加点击跳转逻辑
            MyRouter.pushNamed(context, '/detail', arguments: 'Hello from Home');
          },
        ),
        Divider(height: 1, thickness: 0.5),
      ],
    );
  }
}




// import 'package:flutter/material.dart';
//
// class MePage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() => new _MePageState();
// }
//
// class _MePageState extends State<MePage> {
//   @override
//
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//        home:  new Scaffold(
//           appBar: new AppBar(  title: new Text('我的'),
//            centerTitle: true,
//           ),
//            body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 200,
//               color: Colors.blue,
//               child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//                  child: Row(
//                    children: [
//                     CircleAvatar(
//                       radius: 55,
//                       backgroundColor: Colors.green,
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundImage: NetworkImage("https://s3.o7planning.com/images/boy-128.png"),
//                         backgroundColor: Colors.cyan[100],
//                       ),
//                     ),
//               SizedBox(width: 20),
//                      Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: [
//                          Text(
//                            '码农晨仔',
//                            style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 24,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                          SizedBox(height: 10),
//                          Text(
//                            '微信号：chenzai520',
//                            style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 16,
//                            ),
//                          ),
//                        ],
//                      ),
//                      Spacer(),
//                      Image.network(
//                        'https://s3.o7planning.com/images/boy-128.png',
//                        scale: 1.0,
//                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
//                          return const Text('网络错误');
//                        },
//                      ),
//                    ],
//                  ),
//               ),
//
//             ),
//
//             SizedBox(height: 20),
//             ListTile(
//               leading: Icon(Icons.message),
//               title: Text('微信支付'),
//               trailing: Icon(Icons.arrow_forward_ios),
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('收藏'),
//               trailing: Icon(Icons.arrow_forward_ios),
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('相册'),
//               trailing: Icon(Icons.arrow_forward_ios),
//             ),
//          Divider(),
//          ListTile(
//           leading: Icon(Icons.wallet_travel),
//            title: Text('卡包'),
//            trailing: Icon(Icons.arrow_forward_ios),
//          ),
//
//             Divider(),
//           ListTile(
//           leading: Icon(Icons.location_on),
//            title: Text('表情'),
//            trailing: Icon(Icons.arrow_forward_ios),
//          ),
//
//             Divider(),
//            ListTile(
//              leading: Icon(Icons.search),
//              title: Text('设置'),
//              trailing: Icon(Icons.arrow_forward_ios),
//             ),
//           ],
//          ),
//        ),
//     );
//   }
//
//   Widget checkUrl(String url) {
//     try {
//       return Image.network(
//           url,
//           height: 70.0,
//           width: 70.0,
//           fit: BoxFit.cover);
//     } catch (e) {
//       return Icon(Icons.image);
//     }
//   }
//
//
// }
//
//
// //
// // class MePage extends StatefulWidget{
// //   @override
// //   State<StatefulWidget> createState() => new _MePageState();
// // }
// //
// // class _MePageState extends State<MePage> {
// //   List _itemTitles = [
// //     '消息',
// //     '阅读记录',
// //     '互动',
// //     '邀请好友',
// //   ];
// //
// //   List _itemIcons = [
// //   Icons.message,
// //   Icons.phone,
// //   Icons.send,
// //   Icons.person];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return new MaterialApp(
// //       home: new Scaffold(
// //         appBar: new AppBar(
// //           title: new Text('我的'),
// //           actions: <Widget>[
// //             new Container(
// //               child: null,
// //             )
// //           ],
// //         ),
// //         // body:
// //         ),
// //     );
// //   }
// //
// // }