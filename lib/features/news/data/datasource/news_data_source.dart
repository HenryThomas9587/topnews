import 'package:topnews/features/news/domain/entity/news_entity.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsEntity>> getNews({int page = 1, int pageSize = 10});
}

abstract class NewsLocalDataSource {
  Future<List<NewsEntity>> getCachedNews();
  Future<void> cacheNews(List<NewsEntity> news);
  Future<void> clearCache();
}
