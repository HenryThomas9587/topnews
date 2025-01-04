import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/home/domain/entity/story_entity.dart';
import 'package:topnews/features/home/presentation/provider/category_provider.dart';

part 'story_provider.g.dart';

@riverpod
List<StoryEntity> stories(Ref ref) {
  return [];
}

@riverpod
List<StoryEntity> filteredStories(Ref ref) {
  final category = ref.watch(categoryFilterProvider);
  final stories = ref.watch(storiesProvider);

  if (category == 'All') {
    return stories;
  }

  return stories.where((story) => story.category == category).toList();
}
