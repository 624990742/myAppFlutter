import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewModel/short_video_viewModel.dart';
import '../model/short_video_model.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class ShortVideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShortVideoViewModel>(
      builder: (context, vm, child) {
        print("当前视频数量：${vm.videoList.length}"); // 加上这行
        return PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: vm.videoList.length,
          onPageChanged: vm.setCurrentIndex,
          itemBuilder: (context, index) {
            final video = vm.videoList[index];
            return Stack(
              fit: StackFit.expand,
              children: [
                // 封面图
                Image.network(video.coverUrl, fit: BoxFit.cover),
                // CachedNetworkImage(
                //   imageUrl: video.coverUrl,
                //   fit: BoxFit.cover,
                //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                // ),
                // 半透明遮罩
                Container(color: Colors.black.withOpacity(0.2)),
                // 底部信息栏
                Positioned(
                  left: 16, right: 16, bottom: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // 用户头像
                      CircleAvatar(
                        backgroundImage: NetworkImage(video.userAvatar),
                        radius: 28,
                      ),
                      SizedBox(width: 12),
                      // 标题和用户名
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(video.title, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 6),
                            Text('@${video.userName}', style: TextStyle(color: Colors.white70, fontSize: 14)),
                          ],
                        ),
                      ),
                      // 右侧操作栏
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite, color: Colors.white, size: 32),
                          Text('${video.likeCount}', style: TextStyle(color: Colors.white)),
                          SizedBox(height: 18),
                          Icon(Icons.comment, color: Colors.white, size: 32),
                          Text('${video.commentCount}', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}