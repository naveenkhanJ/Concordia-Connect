// ignore: file_names
class PostModel {
  final String id;
  final String username;
  // ignore: non_constant_identifier_names
  final String UserImage;
  final String postContent;
  final String postImage;
  int likes;
  bool isLiked;
  List<String> comment;

  PostModel({
    required this.id,
    required this.username,
    // ignore: non_constant_identifier_names
    required this.UserImage,
    required this.postContent,
    required this.postImage,
    this.likes = 0,
    this.isLiked = false,
    this.comment = const [],
  });
}
