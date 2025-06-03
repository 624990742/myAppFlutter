import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../viewModel/goods_list_viewModel.dart';
import '../model/goods_model.dart';
import '../view/goods_detail_page.dart';


class GoodsListPage extends StatefulWidget {
  @override
  State<GoodsListPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final vm = Provider.of<GoodsListViewModel>(context, listen: false);
    vm.loadData(refresh: true);
    _scrollController.addListener(() {
      final vm = Provider.of<GoodsListViewModel>(context, listen: false);
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !vm.isLoading && vm.hasMore) {
        vm.loadData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('瀑布流商品')),
      body: Consumer<GoodsListViewModel>(
        builder: (context, vm, child) {
          return RefreshIndicator(
            onRefresh: () => vm.loadData(refresh: true),
            child: MasonryGridView.count(
              controller: _scrollController,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: vm.goodsList.length + 1,
              itemBuilder: (context, index) {
                if (index == vm.goodsList.length) {
                  if (!vm.hasMore) {
                    return Center(child: Text('没有更多了', style: TextStyle(color: Colors.grey)));
                  }
                  return Center(child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator()));
                }
                final item = vm.goodsList[index];
                return _GoodsCard(item: item);
              },
            ),
          );
        },
      ),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}

class _GoodsCard extends StatelessWidget {
  final GoodsModel item;
  const _GoodsCard({required this.item});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => GoodsDetailPage(item: item)),
        );
      },
      child: Container(
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
      ),
    );
  }
}