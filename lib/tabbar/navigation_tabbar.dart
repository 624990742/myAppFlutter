import 'package:flutter/material.dart';

class TabbarIocnView {
 final  BottomNavigationBarItem  barItem; //ios 中的item
 final  AnimationController  controller;//对应的界面
 // 创建 NavigationIconView 需要传入三个参数， icon 图标，title 标题， TickerProvider
  TabbarIocnView({required Widget icon,required String itemTitle,required TickerProvider vsync}):
       barItem = new BottomNavigationBarItem(
        icon: icon,
        label: itemTitle
       ),
       controller = new AnimationController(
           duration: kThemeAnimationDuration,    // 设置动画持续的时间
           vsync: vsync                          // 默认属性和参数
       );

}