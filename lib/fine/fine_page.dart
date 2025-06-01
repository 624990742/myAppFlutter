import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';


class FinePage extends StatefulWidget{
  @override
  State <StatefulWidget>  createState() => new _finePageState();
}

class GoodsModel {
  final String imageUrl;
  final String title;
  final double price;
  final int sales;
  final String shop;
  final double height;
  GoodsModel({required this.imageUrl, required this.title, required this.price, required this.sales, required this.shop, required this.height});
}

List<GoodsModel> fakeGoodsList = List.generate(20, (index) {
  final random = Random();
  return GoodsModel(
    imageUrl: 'https://picsum.photos/200/${250 + random.nextInt(100)}?random=$index',
    title: '淘宝热卖商品${index + 1} 超级好用超值推荐',
    price: 9.9 + random.nextInt(100),
    sales: 1000 + random.nextInt(9000),
    shop: '旗舰店${random.nextInt(10) + 1}',
    height: 220 + random.nextInt(80).toDouble(),
  );
});



class  _finePageState extends State <FinePage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('淘宝瀑布流商品')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: fakeGoodsList.length,
          itemBuilder: (context, index) {
            final item = fakeGoodsList[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0,2))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                    child: Image.network(
                      item.imageUrl,
                      height: item.height,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Text('￥', style: TextStyle(color: Colors.red, fontSize: 13)),
                            Text(
                              item.price.toStringAsFixed(2),
                              style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text('已售${item.sales}', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          item.shop,
                          style: TextStyle(color: Colors.orange, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}

/*
*
class FinePage extends StatefulWidget{
  @override
  State <StatefulWidget>  createState() => new _finePageState();
}

class  _finePageState extends State <FinePage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
//    throw UnimplementedError();
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("发现"),
          actions: <Widget>[],
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.red),
          child: Text(
            '声明布局',
              textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blue),
          ),
        ),
      ),
    );
  }
}

* */