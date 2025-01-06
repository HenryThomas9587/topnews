import 'package:topnews/features/news/domain/entity/category_entity.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/domain/entity/trending_news_entity.dart';

enum HomeSectionType {
  trending,
  category,
  story,
}

class HomeSection {
  final HomeSectionType type;
  final NewsEntity? item;
  final List<TrendingNewsEntity>? trendingNews;
  final String? title;
  final List<CategoryEntity>? categorys;

  const HomeSection({
    required this.type,
    this.item,
    this.trendingNews,
    this.title,
    this.categorys,
  });
}
