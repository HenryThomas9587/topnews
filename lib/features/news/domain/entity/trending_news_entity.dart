class TrendingNewsEntity {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String author;
  final String authorAvatar;
  final String category;
  final DateTime publishedAt;
  final int views;
  final int comments;

  const TrendingNewsEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.author,
    required this.authorAvatar,
    required this.category,
    required this.publishedAt,
    this.views = 0,
    this.comments = 0,
  });
}
