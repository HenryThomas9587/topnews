import 'package:flutter/material.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/features/home/domain/entity/home_section.dart';
import 'package:topnews/features/news/presentation/widget/news_card.dart';
import 'package:topnews/features/news/presentation/widget/trending_section.dart';
import 'package:topnews/features/news/presentation/widget/category_filter.dart';

class SectionRenderer extends StatelessWidget {
  final HomeSection section;

  const SectionRenderer({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return switch (section.type) {
      HomeSectionType.trending => TrendingSection(
          items: section.trendingNews ?? [],
          onViewAll: () {
            context.pushNewsList('Trending');
          },
        ),
      HomeSectionType.category => CategoryFilter(
          title: 'Recent Stories',
          categories: section.categorys ?? [],
          selectedCategory: null,
          onCategorySelected: (category) {},
          onViewAll: () {
            context.pushNewsTab('Recent Stories');
          },
        ),
      HomeSectionType.story => section.item != null
          ? NewsCard(news: section.item!)
          : const SizedBox.shrink(),
    };
  }
}
