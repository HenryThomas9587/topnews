import 'package:topnews/features/news/data/model/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getTrendingNews(int page, int pageSize);
  Future<List<NewsModel>> getTopNews();
  Future<List<NewsModel>> getRecommendedNews(int page, int pageSize);
  Future<List<NewsModel>> getLatestNews(int page, int pageSize);
  Future<List<NewsModel>> searchNews(int page, int pageSize, String keyword);
  Future<List<NewsModel>> getCategoryNews(
      int page, int pageSize, String categoryId);
  Future<NewsModel> getNewsDetail(String id);
}

abstract class NewsLocalDataSource {
  Future<List<NewsModel>> getCachedNews(String key);
  Future<void> cacheNews(String key, List<NewsModel> news);
  Future<void> clearCache(String key);
}
