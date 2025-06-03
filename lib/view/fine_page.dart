import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'goods_list_page.dart';
import '../viewModel/goods_list_viewModel.dart';

class FinePage extends StatefulWidget{
  @override
  State <StatefulWidget>  createState() => new _finePageState();
}


class  _finePageState extends State <FinePage> with SingleTickerProviderStateMixin{
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: GoodsListPage(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoodsListPage(),
    );
  }
}
