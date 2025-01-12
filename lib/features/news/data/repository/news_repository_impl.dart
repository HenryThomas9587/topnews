import 'package:topnews/core/util/logger.dart';
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
  Future<List<NewsEntity>> getTrendingNews(int page, int pageSize) async {
    final news = await remoteDataSource.getTrendingNews(page, pageSize);
    return news.map((item) => item.toEntity()).toList();
  }

  @override
  Future<List<NewsEntity>> getLatestNews(int page, int pageSize) async {
    final news = await remoteDataSource.getLatestNews(page, pageSize);
    return news.map((item) => item.toEntity()).toList();
  }

  @override
  Future<List<NewsEntity>> getTopNews() async {
    final news = await remoteDataSource.getTopNews();
    return news.map((item) => item.toEntity()).toList();
  }

  @override
  Future<List<NewsEntity>> getRecommendedNews(int page, int pageSize) async {
    final news = await remoteDataSource.getRecommendedNews(page, pageSize);
    return news.map((item) => item.toEntity()).toList();
  }

  @override
  Future<List<NewsEntity>> getCategoryNews(
      int page, int pageSize, String categoryId) async {
    final news =
        await remoteDataSource.getCategoryNews(page, pageSize, categoryId);
    return news.map((item) => item.toEntity()).toList();
  }

  @override
  Future<List<NewsEntity>> searchNews(
      int page, int pageSize, String keyword) async {
    try {
      final news = await remoteDataSource.searchNews(page, pageSize, keyword);
      // 打印
      logDebug("searchNews: $news");
      return news.map((item) => item.toEntity()).toList();
    } catch (e) {
      final cachedNews = await localDataSource.getCachedNews("search_news");
      return cachedNews.map((item) => item.toEntity()).toList();
    }
  }

  @override
  Future<NewsEntity> getNewsDetail(String newsId) async {
    final news = await remoteDataSource.getNewsDetail(newsId);
    return news.toEntity();
  }
}
