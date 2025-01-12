import 'package:topnews/features/news/data/datasource/mock/mock_news_data.dart';
import 'package:topnews/features/news/data/datasource/news_data_source.dart';
import 'package:topnews/features/news/data/model/news_model.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final MockNewsDataSource mockNewsDataSource = MockNewsDataSource();

  @override
  Future<List<NewsModel>> getTrendingNews(int page, int pageSize) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));
    return mockNewsDataSource.getTrendingNews(page, pageSize);
  }

  @override
  Future<List<NewsModel>> getTopNews() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));
    return mockNewsDataSource.getTopNews();
  }

  @override
  Future<List<NewsModel>> getLatestNews(int page, int pageSize) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));
    return mockNewsDataSource.getLatestNews(page, pageSize);
  }

  @override
  Future<List<NewsModel>> getRecommendedNews(int page, int pageSize) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));
    return mockNewsDataSource.getRecommendedNews(page, pageSize);
  }

  @override
  Future<List<NewsModel>> getCategoryNews(
      int page, int pageSize, String categoryId) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));
    return mockNewsDataSource.getCategoryNews(page, pageSize, categoryId);
  }

  @override
  Future<List<NewsModel>> searchNews(
      int page, int pageSize, String keyword) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));
    return mockNewsDataSource.searchNews(page, pageSize, keyword);
  }

  @override
  Future<NewsModel> getNewsDetail(String newsId) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));
    return mockNewsDataSource.getNewsDetailById(newsId);
  }
}
