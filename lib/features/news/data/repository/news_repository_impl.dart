import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/error/app_error.dart';
import 'package:topnews/features/news/data/datasource/news_remote_data_source.dart';
import 'package:topnews/features/news/data/datasource/news_remote_data_source_impl.dart';
import 'package:topnews/features/news/data/datasource/news_local_data_source.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/domain/repository/news_repository.dart';

part 'news_repository_impl.g.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final NewsRemoteDataSource _remoteDataSource;
  final NewsLocalDataSource _localDataSource;

  @override
  Future<List<NewsEntity>> getNewsList() async {
    try {
      final remoteNews = await _remoteDataSource.getNewsList();
      await _localDataSource.cacheNewsList(remoteNews);
      return remoteNews.map((model) => model.toEntity()).toList();
    } on DioException catch (e) {
      // 网络错误时尝试使用缓存
      final cachedNews = await _localDataSource.getCachedNewsList();
      if (cachedNews.isEmpty) {
        throw AppError.fromDioError(e);
      }
      return cachedNews.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw AppError.unknown(e.toString());
    }
  }

  @override
  Future<NewsEntity> getNewsDetail(String id) async {
    try {
      final model = await _remoteDataSource.getNewsDetail(id);
      return model.toEntity();
    } on DioException catch (e) {
      throw AppError.fromDioError(e);
    } catch (e) {
      throw AppError.unknown(e.toString());
    }
  }
}

@riverpod
NewsRepository newsRepository(Ref ref) {
  final remoteDataSource = ref.watch(newsRemoteDataSourceProvider);
  final localDataSource = ref.watch(newsLocalDataSourceProvider);
  return NewsRepositoryImpl(remoteDataSource, localDataSource);
}
