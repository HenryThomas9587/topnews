import 'package:topnews/features/home/domain/entity/story_entity.dart';

abstract class StoryRemoteDataSource {
  Future<List<StoryEntity>> getStories({int page = 1, int pageSize = 10});
}

abstract class StoryLocalDataSource {
  Future<List<StoryEntity>> getCachedStories();
  Future<void> cacheStories(List<StoryEntity> stories);
  Future<void> clearCache();
}
