class Post {
  final int postId;
  final int userId;
  final String title;
  final String description;
  final String imgUrl;
  // final String? postCategory;
  // final String? readTime;
  // final String content;
  // final int isPublished;
  // final String createdAt;
  // final String updatedAt;

  Post({
    required this.postId,
    required this.userId,
    required this.title,
    required this.description,
    required this.imgUrl,
    // this.postCategory,
    // this.readTime,
    // required this.content,
    // required this.isPublished,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      "post_id": int postId,
      "user_id": int userId,
      "title": String title,
      "description": String description,
      "img_url": String imUrl
      } => Post(
        postId: postId,
        userId: userId,
        title: title,
        description: description,
        imgUrl: imUrl,
          ),
      _ => throw const FormatException('Failed to load post.'),
    };
  }
}
