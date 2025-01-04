import 'package:topnews/features/home/data/datasource/story_data_source.dart';
import 'package:topnews/features/home/domain/entity/story_entity.dart';
import 'package:topnews/features/home/domain/repository/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryRemoteDataSource remoteDataSource;
  final StoryLocalDataSource localDataSource;

  StoryRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<StoryEntity>> getStories(
      {int page = 1, int pageSize = 10}) async {
    try {
      final stories =
          await remoteDataSource.getStories(page: page, pageSize: pageSize);
      await localDataSource.cacheStories(stories);
      return stories;
    } catch (e) {
      return localDataSource.getCachedStories();
    }
  }

  @override
  Future<void> refreshStories() async {
    await localDataSource.clearCache();
  }
}
