import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/core/widget/base_section.dart';
import 'package:topnews/features/news/presentation/widget/story_card.dart';

class StorySection extends StatelessWidget {
  final String title;
  final List<NewsEntity> items;
  final VoidCallback? onViewAll;

  const StorySection({
    super.key,
    required this.title,
    required this.items,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSection(
      title: title,
      onViewAll: onViewAll,
      child: SizedBox(
        height: 280,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          separatorBuilder: (context, index) =>
              const SizedBox(width: AppTheme.spaceSm),
          itemBuilder: (context, index) => StoryCard(item: items[index]),
        ),
      ),
    );
  }
}
