import 'package:topnews/features/news/domain/entity/category_entity.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

enum HomeSectionType {
  trending('Trending'),
  category('Category'),
  story('Recent Stories');

  final String value;
  const HomeSectionType(this.value);
}

class HomeSection {
  final HomeSectionType type;
  final NewsEntity? item;
  final List<NewsEntity>? trendingNews;
  final List<CategoryEntity>? categorys;

  const HomeSection({
    required this.type,
    this.item,
    this.trendingNews,
    this.categorys,
  });
}
