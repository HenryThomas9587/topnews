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
  final List<NewsEntity>? trendingList;
  final List<CategoryEntity>? categoryList;

  const HomeSection({
    required this.type,
    this.item,
    this.trendingList,
    this.categoryList,
  });
}
