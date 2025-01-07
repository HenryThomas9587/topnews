import 'package:flutter/material.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/features/discover/domain/entity/discover_section.dart';
import 'package:topnews/features/discover/presentation/widget/author_list.dart';
import 'package:topnews/features/discover/presentation/widget/publisher_list.dart';
import 'package:topnews/features/news/presentation/widget/story_section.dart';

class SectionRenderer extends StatelessWidget {
  const SectionRenderer({
    super.key,
    required this.section,
  });

  final DiscoverSection section;

  @override
  Widget build(BuildContext context) {
    return switch (section.type) {
      DiscoverType.topStories => StorySection(
          title: section.type.value,
          items: section.topStories ?? [],
          onViewAll: () {
            context.pushNewsList(section.type.value);
          },
        ),
      DiscoverType.publishers => const PublisherList(),
      DiscoverType.authors => const AuthorList(),
      DiscoverType.recommended => StorySection(
          title: section.type.value,
          items: section.recommended ?? [],
          onViewAll: () {
            context.pushNewsList(section.type.value);
          },
        ),
    };
  }
}
