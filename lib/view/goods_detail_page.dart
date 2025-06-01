import 'package:flutter/material.dart';
import '../model/goods_model.dart';

class GoodsDetailPage extends StatelessWidget {
  final GoodsModel item;
  const GoodsDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品详情')),
      body: ListView(
        children: [
          Image.network(item.imageUrl, height: 320, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text('￥', style: TextStyle(color: Colors.red, fontSize: 16)),
                    Text(item.price.toStringAsFixed(2), style: TextStyle(color: Colors.red, fontSize: 26, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text('已售${item.sales}', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
                SizedBox(height: 12),
                Text('店铺：${item.shop}', style: TextStyle(color: Colors.orange, fontSize: 15)),
                Divider(height: 32),
                Text('商品描述', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 8),
                Text('这是一个仿淘宝的商品详情页，支持图片、标题、价格、销量、店铺等信息展示。你可以根据实际需求扩展更多内容。', style: TextStyle(fontSize: 14, color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}