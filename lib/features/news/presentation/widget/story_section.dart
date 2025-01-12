import 'package:flutter/material.dart';
import 'package:topnews/features/news/config/news_type.dart';
import 'package:topnews/core/widget/base_section.dart';
import 'package:topnews/features/news/presentation/widget/story_recommended_list.dart';

class StorySection extends StatelessWidget {
  final String title;
  final NewsType newsType;
  final VoidCallback? onViewAll;

  const StorySection({
    super.key,
    required this.title,
    required this.newsType,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSection(
      title: title,
      onViewAll: onViewAll,
      child: StoryRecommendedList(newsType: newsType),
    );
  }
}
