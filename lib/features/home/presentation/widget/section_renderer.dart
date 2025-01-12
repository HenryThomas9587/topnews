import 'package:flutter/material.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/features/home/domain/entity/home_section.dart';
import 'package:topnews/features/news/config/news_type.dart';
import 'package:topnews/features/news/presentation/widget/news_card.dart';
import 'package:topnews/features/news/presentation/widget/story_column_list.dart';
import 'package:topnews/features/news/presentation/widget/category_filter.dart';

class SectionRenderer extends StatelessWidget {
  final HomeSection section;

  const SectionRenderer({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return switch (section.type) {
      HomeSectionType.trending => StoryColumnList(
          news: section.trendingList ?? [],
          newsType: NewsType.trending,
        ),
      HomeSectionType.category => CategoryFilter(
          title: HomeSectionType.category.value,
          categories: section.categoryList ?? [],
          selectedCategory: null,
          onCategorySelected: (category) {},
          onViewAll: () {
            context.pushNewsTab(NewsType.category.name);
          },
        ),
      HomeSectionType.story => section.item != null
          ? NewsCard(news: section.item!)
          : const SizedBox.shrink(),
    };
  }
}
