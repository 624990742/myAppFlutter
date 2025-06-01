import 'dart:math';
import 'package:flutter/material.dart';
import '../model/goods_model.dart';

class GoodsListViewModel extends ChangeNotifier {
  List<GoodsModel> goodsList = [];
  bool isLoading = false;
  bool hasMore = true;
  int page = 1;

  Future<void> loadData({bool refresh = false}) async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    if (refresh) {
      page = 1;
      goodsList.clear();
      hasMore = true;
    }
    if (page > 5) {
      hasMore = false;
      isLoading = false;
      notifyListeners();
      return;
    }
    final random = Random();
    List<GoodsModel> newGoods = List.generate(20, (index) {
      int globalIndex = (page - 1) * 20 + index;
      return GoodsModel(
        imageUrl: 'https://picsum.photos/200/${250 + random.nextInt(100)}?random=$globalIndex',
        title: '淘宝热卖商品${globalIndex + 1} 超级好用超值推荐',
        price: 9.9 + random.nextInt(100),
        sales: 1000 + random.nextInt(9000),
        shop: '旗舰店${random.nextInt(10) + 1}',
        height: 220 + random.nextInt(80).toDouble(),
      );
    });
    goodsList.addAll(newGoods);
    isLoading = false;
    page++;
    notifyListeners();
  }
}