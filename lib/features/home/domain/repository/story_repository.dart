import 'package:topnews/features/home/domain/entity/story_entity.dart';

abstract class StoryRepository {
  Future<List<StoryEntity>> getStories({int page = 1, int pageSize = 10});
  Future<void> refreshStories();
}
