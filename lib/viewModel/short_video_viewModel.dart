import 'package:flutter/material.dart';
import '../model/short_video_model.dart';

class ShortVideoViewModel extends ChangeNotifier {
  List<ShortVideoModel> _videoList = [];
  int _currentIndex = 0;

  List<ShortVideoModel> get videoList => _videoList;
  int get currentIndex => _currentIndex;

  ShortVideoViewModel() {
    loadFakeData();
  }

  void loadFakeData() {
    _videoList = List.generate(10, (index) => ShortVideoModel(
      id: '$index',
      videoUrl: 'https://www.example.com/video$index.mp4',
      coverUrl: 'https://picsum.photos/400/700?random=$index',
      title: '淘宝短视频商品标题$index',
      userName: '用户$index',
      userAvatar: 'https://i.pravatar.cc/150?img=$index',
      likeCount: 1000 + index * 3,
      commentCount: 200 + index * 2,
    ));
    print('加载完毕 videoList.length = ${_videoList.length}');// 加上这行
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}