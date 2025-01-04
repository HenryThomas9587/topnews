import 'package:flutter/material.dart';
import 'package:topnews/features/home/domain/entity/home_section.dart';
import 'package:topnews/features/home/presentation/widget/story_card.dart';
import 'package:topnews/features/home/presentation/widget/trending_section.dart';
import 'package:topnews/features/home/presentation/widget/category_filter.dart';

class SectionRenderer extends StatelessWidget {
  final HomeSection section;

  const SectionRenderer({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return switch (section.type) {
      HomeSectionType.trending => TrendingSection(
          items: section.trendingNews ?? [],
          onViewAll: () {
            // TODO: 实现查看全部
          },
        ),
      HomeSectionType.category => CategoryFilter(
          categories: section.category ?? [],
          selectedCategory: '',
          onCategorySelected: (category) {
            // TODO: 实现选择分类
          },
        ),
      HomeSectionType.story => section.item != null
          ? Padding(
              padding: const EdgeInsets.only(top: 24),
              child: StoryCard(story: section.item!),
            )
          : const SizedBox.shrink(),
    };
  }
}
