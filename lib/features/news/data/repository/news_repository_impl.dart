import 'package:topnews/features/news/data/datasource/news_data_source.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<NewsEntity>> getNews({
    int page = 1,
    int pageSize = 10,
    int? categoryId,
  }) async {
    try {
      final news = await remoteDataSource.getNews(
        page: page,
        pageSize: pageSize,
      );

      if (categoryId != null && categoryId != 0) {
        return news.where((item) => item.categoryId == categoryId).toList();
      }
      return news;
    } catch (e) {
      final cachedNews = await localDataSource.getCachedNews();
      if (categoryId != null && categoryId != 0) {
        return cachedNews
            .where((item) => item.categoryId == categoryId)
            .toList();
      }
      return cachedNews;
    }
  }

  @override
  Future<void> refreshNews() async {
    await localDataSource.clearCache();
  }
}
