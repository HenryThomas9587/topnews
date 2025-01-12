import 'package:topnews/features/news/domain/entity/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getTrendingNews(int page, int pageSize);

  Future<List<NewsEntity>> getLatestNews(int page, int pageSize);

  Future<List<NewsEntity>> getTopNews();

  Future<List<NewsEntity>> getRecommendedNews(int page, int pageSize);

  Future<List<NewsEntity>> getCategoryNews(
      int page, int pageSize, String categoryId);

  Future<List<NewsEntity>> searchNews(int page, int pageSize, String keyword);

  Future<NewsEntity> getNewsDetail(String id);
}
