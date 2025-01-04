import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/features/home/domain/entity/home_section.dart';
import 'package:topnews/features/home/presentation/widget/category_filter.dart';
import 'package:topnews/features/home/presentation/widget/story_list.dart';
import 'package:topnews/features/home/presentation/widget/trending_section.dart';

class SectionRenderer extends ConsumerWidget {
  final HomeSection section;

  const SectionRenderer({super.key, required this.section});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (section.type) {
      HomeSectionType.trending => SliverToBoxAdapter(
          child: TrendingSection(
            items: section.trendingNews ?? [],
            onViewAll: () {
              // TODO: 实现查看全部
            },
          ),
        ),
      HomeSectionType.category => SliverToBoxAdapter(
          child: CategoryFilter(
            categories: section.category ?? [],
            selectedCategory: '',
            onCategorySelected: (category) {
              // TODO: 实现选择分类
            },
          ),
        ),
      HomeSectionType.story => SliverPadding(
          padding: const EdgeInsets.only(top: 24),
          sliver: StoryList(stories: section.items),
        ),
    };
  }
}
