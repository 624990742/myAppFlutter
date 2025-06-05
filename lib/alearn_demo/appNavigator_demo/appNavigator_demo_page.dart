// // 导航工具类：统一管理页面跳转方式与动画（含 Flutter Boost 支持）
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_boost/flutter_boost.dart';
//
// class AppNavigator {
//   // 标准 push 跳转（Flutter 页面）
//   static void push(BuildContext context, Widget page) {
//     Navigator.push(context, MaterialPageRoute(builder: (_) => page));
//   }
//
//   // 淡入淡出动画跳转
//   static void pushFade(BuildContext context, Widget page) {
//     Navigator.push(context, _createFadeRoute(page));
//   }
//
//   // 底部滑入动画跳转
//   static void pushSlideFromBottom(BuildContext context, Widget page) {
//     Navigator.push(context, _createSlideFromBottom(page));
//   }
//
//   // 水平翻页动画跳转（类似 iOS 翻转）
//   static void pushFlipHorizontal(BuildContext context, Widget page) {
//     Navigator.push(context, _createFlipRoute(page));
//   }
//
//   // 替换当前页面跳转
//   static void pushReplace(BuildContext context, Widget page) {
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
//   }
//
//   // 跳转并清除栈中所有页面
//   static void pushAndRemoveAll(BuildContext context, Widget page) {
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => page),
//           (route) => false,
//     );
//   }
//
//   // --- 自定义动画 --- //
//   static Route _createFadeRoute(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (_, anim, __, child) =>
//           FadeTransition(opacity: anim, child: child),
//       transitionDuration: Duration(milliseconds: 400),
//     );
//   }
//
//   static Route _createSlideFromBottom(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (_, anim, __, child) => SlideTransition(
//         position: Tween(begin: Offset(0, 1), end: Offset.zero).animate(anim),
//         child: child,
//       ),
//       transitionDuration: Duration(milliseconds: 400),
//     );
//   }
//
//   static Route _createFlipRoute(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (_, animation, __, child) {
//         final rotate = Tween(begin: pi, end: 0.0).animate(animation);
//         return AnimatedBuilder(
//           animation: rotate,
//           child: child,
//           builder: (context, child) {
//             return Transform(
//               transform: Matrix4.rotationY(rotate.value),
//               alignment: Alignment.center,
//               child: child,
//             );
//           },
//         );
//       },
//       transitionDuration: Duration(milliseconds: 600),
//     );
//   }
//
//   // --- Flutter Boost 混合导航 --- //
//   static void boostNavigateTo(String pageName, {Map<String, dynamic>? arguments}) {
//     BoostNavigator.instance.push(pageName, arguments: arguments ?? {});
//   }
//
//   static void boostReplaceTo(String pageName, {Map<String, dynamic>? arguments}) {
//     BoostNavigator.instance.push(pageName, arguments: arguments ?? {}, withContainer: true);
//   }
//
//   static void boostPop<T extends Object?>([T? result]) {
//     BoostNavigator.instance.pop(result);
//   }
// }
//
// // --- Flutter Boost 初始化模板 --- //
// class MyBoostApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BoostApp(
//       router: _routerMap,
//       appBuilder: (home) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: home,
//       ),
//     );
//   }
//
//   Map<String, FlutterBoostRouteFactory> get _routerMap => <String, FlutterBoostRouteFactory>{
//     'flutterPage1': (settings, uniqueId) {
//       final args = settings.arguments as Map? ?? {};
//       return MaterialPageRoute(
//         builder: (_) => FlutterPage1(title: args['title'] ?? '页面1'),
//       );
//     },
//     'flutterPage2': (settings, uniqueId) {
//       return MaterialPageRoute(
//         builder: (_) => FlutterPage2(),
//       );
//     },
//   };
// }
//
// class FlutterPage1 extends StatelessWidget {
//   final String title;
//   const FlutterPage1({super.key, required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Center(child: ElevatedButton(
//         onPressed: () => AppNavigator.boostPop("来自 FlutterPage1 的返回"),
//         child: Text("返回 Native 或上层页面"),
//       )),
//     );
//   }
// }
//
// class FlutterPage2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Flutter Page 2")),
//       body: Center(child: Text("这是 Flutter 页面 2")),
//     );
//   }
// }
//
// void main() {
//   runApp(MyBoostApp());
// }
//
// // --- 原生端配置指引 --- //
//
// // ✅ iOS AppDelegate 示例（Swift）：
// // import FlutterBoost
// //
// // @UIApplicationMain
// // class AppDelegate: FlutterAppDelegate {
// //   override func application(
// //     _ application: UIApplication,
// //     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
// //   ) -> Bool {
// //     let flutterEngine = BoostFlutterEngine(name: "my_engine")
// //     flutterEngine.run()
// //     FlutterBoost.instance().setup(application, delegate: self, callback: nil)
// //     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
// //   }
// //
// //   func boostFlutterRoute(for url: String, params: [AnyHashable : Any]) -> FlutterViewController? {
// //     return FlutterBoost.instance().flutterViewController(for: url, params: params)
// //   }
// // }
//
// // ✅ Android Application 示例：
// // class MyApplication : Application(), FlutterBoostDelegate {
// //   override fun onCreate() {
// //     super.onCreate()
// //     FlutterBoost.instance().setup(this, this) { }
// //   }
// //
// //   override fun createFlutterViewContainer(context: Context?): PlatformViewContainer {
// //     return FlutterBoostUtils.createFlutterView(context)
// //   }
// // }
// //
// // class MainActivity : BoostFlutterActivity() {
// //   override fun getContainerUrl(): String {
// //     return "flutterPage1"
// //   }
// //
// //   override fun getContainerParams(): MutableMap<String, Any>? {
// //     return hashMapOf("title" to "来自 Native 的标题")
// //   }
// // }