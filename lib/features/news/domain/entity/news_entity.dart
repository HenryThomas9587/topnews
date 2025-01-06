class NewsEntity {
  final String id;
  final String title;
  final String content;
  final DateTime publishedAt;
  final String? imageUrl;
  final String? author;
  final String? authorAvatar;
  final String? category;
  final int? categoryId;
  final int readTime;
  final int likes;
  final int views;
  final int comments;
  final bool isFavorite;

  const NewsEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.publishedAt,
    this.imageUrl,
    this.author,
    this.authorAvatar,
    this.category,
    this.categoryId,
    this.readTime = 0,
    this.likes = 0,
    this.views = 0,
    this.comments = 0,
    this.isFavorite = false,
  });
}
