import 'package:topnews/features/news/data/model/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getTrendingNews();
  Future<List<NewsModel>> getTopNews();
  Future<List<NewsModel>> getRecommendedNews();
  Future<List<NewsModel>> getNews(
      {int page = 1, int pageSize = 10, int? categoryId});
}

abstract class NewsLocalDataSource {
  Future<List<NewsModel>> getCachedNews();
  Future<void> cacheNews(List<NewsModel> news);
  Future<void> clearCache();
}
