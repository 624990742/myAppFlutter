import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view/goods_list_page.dart';
import '../viewmodel/goods_list_viewmodel.dart';

class FinePage extends StatefulWidget{
  @override
  State <StatefulWidget>  createState() => new _finePageState();
}


class  _finePageState extends State <FinePage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoodsListPage(),
    );
  }
}
