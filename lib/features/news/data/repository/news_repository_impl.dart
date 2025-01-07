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
  Future<List<NewsEntity>> getTrendingNews() async {
    final news = await remoteDataSource.getTrendingNews();
    return news.map((item) => item.toEntity()).toList();
  }

  @override
  Future<List<NewsEntity>> getTopNews() async {
    final news = await remoteDataSource.getTopNews();
    return news.map((item) => item.toEntity()).toList();
  }

  @override
  Future<List<NewsEntity>> getRecommendedNews() async {
    final news = await remoteDataSource.getRecommendedNews();
    return news.map((item) => item.toEntity()).toList();
  }

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
        categoryId: categoryId,
      );
      if (categoryId != null && categoryId != 0) {
        return news
            .map((item) => item.toEntity())
            .where((item) => item.categoryId == categoryId)
            .toList();
      }
      return news.map((item) => item.toEntity()).toList();
    } catch (e) {
      final cachedNews = await localDataSource.getCachedNews();
      if (categoryId != null && categoryId != 0) {
        return cachedNews
            .map((item) => item.toEntity())
            .where((item) => item.categoryId == categoryId)
            .toList();
      }
      return cachedNews.map((item) => item.toEntity()).toList();
    }
  }
}
