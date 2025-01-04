class StoryEntity {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final String author;
  final String authorAvatar;
  final DateTime publishedAt;
  final int readTime;
  final int likes;
  final int comments;

  String? category;

  StoryEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.authorAvatar,
    required this.publishedAt,
    required this.readTime,
    required this.likes,
    required this.comments,
    this.category,
  });
}
