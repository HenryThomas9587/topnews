class NewsEntity {
  final String id;
  final String title;
  final String subtitle;
  final String content;
  final String cover;
  final String imageUrl;
  final DateTime publishedAt;
  final String author;
  final String authorAvatar;
  final String category;
  final int categoryId;
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
    required this.author,
    this.subtitle = '',
    this.cover = '',
    this.imageUrl = '',
    this.authorAvatar = '',
    this.category = '',
    this.categoryId = 0,
    this.readTime = 0,
    this.likes = 0,
    this.views = 0,
    this.comments = 0,
    this.isFavorite = false,
  });
}
