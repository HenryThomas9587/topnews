import 'package:flutter/material.dart';
import 'package:topnews/features/discover/config/user_type.dart';
import 'package:topnews/features/discover/domain/entity/discover_section.dart';
import 'package:topnews/features/discover/presentation/widget/author_recommended_list.dart';
import 'package:topnews/features/news/config/news_type.dart';
import 'package:topnews/features/news/presentation/widget/story_recommended_list.dart';

class SectionRenderer extends StatelessWidget {
  final DiscoverSection section;

  const SectionRenderer({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return switch (section.type) {
      DiscoverType.topStories => const StoryRecommendedList(
          newsType: NewsType.top,
        ),
      DiscoverType.publishers =>
        const AuthorRecommendedList(userType: UserType.publisher),
      DiscoverType.authors =>
        const AuthorRecommendedList(userType: UserType.author),
      DiscoverType.recommended => const StoryRecommendedList(
          newsType: NewsType.recommended,
        )
    };
  }
}
