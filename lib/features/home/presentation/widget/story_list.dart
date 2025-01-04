import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/features/home/domain/entity/story_entity.dart';
import 'package:topnews/features/home/presentation/widget/story_card.dart';

class StoryList extends ConsumerWidget {
  const StoryList({super.key, required this.stories});

  final List<StoryEntity> stories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => StoryCard(story: stories[index]),
        childCount: stories.length,
      ),
    );
  }
}
