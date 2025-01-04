import 'package:topnews/features/home/domain/entity/story_entity.dart';
import 'package:topnews/features/home/domain/entity/trending_news_entity.dart';

enum HomeSectionType {
  trending,
  category,
  story,
}

class HomeSection {
  final HomeSectionType type;
  final StoryEntity? item;
  final List<TrendingNewsEntity>? trendingNews;
  final String? title;
  final List<String>? category;

  const HomeSection({
    required this.type,
    this.item,
    this.trendingNews,
    this.title,
    this.category,
  });

  HomeSection copyWith({
    HomeSectionType? type,
    StoryEntity? item,
    List<TrendingNewsEntity>? trendingNews,
    String? title,
    List<String>? category,
  }) {
    return HomeSection(
      type: type ?? this.type,
      item: item ?? this.item,
      trendingNews: trendingNews ?? this.trendingNews,
      title: title ?? this.title,
      category: category ?? this.category,
    );
  }
}
