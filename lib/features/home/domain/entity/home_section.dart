import 'package:topnews/features/home/domain/entity/story_entity.dart';
import 'package:topnews/features/home/domain/entity/trending_news_entity.dart';

enum HomeSectionType {
  trending,
  category,
  story,
}

class HomeSection {
  final HomeSectionType type;
  final List<StoryEntity> items;
  final List<TrendingNewsEntity>? trendingNews;
  final String? title;
  final List<String>? category;

  const HomeSection({
    required this.type,
    required this.items,
    this.trendingNews,
    this.title,
    this.category,
  });
}
