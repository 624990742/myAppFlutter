class ShortVideoModel {
  final String id;
  final String videoUrl;
  final String coverUrl;
  final String title;
  final String userName;
  final String userAvatar;
  final int likeCount;
  final int commentCount;

  ShortVideoModel({
    required this.id,
    required this.videoUrl,
    required this.coverUrl,
    required this.title,
    required this.userName,
    required this.userAvatar,
    required this.likeCount,
    required this.commentCount,
  });
}