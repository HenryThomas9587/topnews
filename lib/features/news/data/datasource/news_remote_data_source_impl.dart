import 'package:topnews/features/news/data/datasource/mock/mock_story_data.dart';
import 'package:topnews/features/news/data/datasource/mock/mock_trending_data.dart';
import 'package:topnews/features/news/data/datasource/news_data_source.dart';
import 'package:topnews/features/news/data/model/news_model.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  Future<List<NewsModel>> getTrendingNews() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 800));
    return mockTrendingNews;
  }

  @override
  Future<List<NewsModel>> getTopNews() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 800));
    return mockTopNews;
  }

  @override
  Future<List<NewsModel>> getRecommendedNews() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 800));
    return mockRecommendedNews;
  }

  @override
  Future<List<NewsModel>> getNews(
      {int page = 1, int pageSize = 10, int? categoryId}) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 800));
    return MockStoryData.mockStories(pageSize);
  }
}
