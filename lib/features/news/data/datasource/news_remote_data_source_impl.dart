import 'package:topnews/features/news/data/datasource/mock/mock_story_data.dart';
import 'package:topnews/features/news/data/datasource/news_data_source.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  Future<List<NewsEntity>> getNews({int page = 1, int pageSize = 10}) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 800));
    return MockStoryData.mockStories(pageSize);
  }
}
