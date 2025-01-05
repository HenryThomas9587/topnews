import 'package:topnews/features/home/data/datasource/mock_story_data.dart';
import 'package:topnews/features/home/data/datasource/story_data_source.dart';
import 'package:topnews/features/home/domain/entity/story_entity.dart';

class StoryRemoteDataSourceImpl implements StoryRemoteDataSource {
  @override
  Future<List<StoryEntity>> getStories(
      {int page = 1, int pageSize = 10}) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 800));
    return MockStoryData.mockStories(pageSize);
  }
}
