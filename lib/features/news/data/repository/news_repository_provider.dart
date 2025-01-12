import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/data/datasource/news_data_source_provider.dart';
import 'package:topnews/features/news/data/datasource/news_publish_source_provider.dart';
import 'package:topnews/features/news/data/repository/news_publish_repository_mpl.dart';
import 'package:topnews/features/news/data/repository/news_repository_impl.dart';
import 'package:topnews/features/news/domain/repository/news_publish_repository.dart';
import 'package:topnews/features/news/domain/repository/news_repository.dart';
import 'package:topnews/features/news/data/datasource/remote/news_remote_data_source_impl.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final localDataSource = ref.watch(newsLocalDataSourceProvider);
  return NewsRepositoryImpl(
    remoteDataSource: NewsRemoteDataSourceImpl(),
    localDataSource: localDataSource,
  );
});

final newsPublishRepositoryProvider = Provider<NewsPublishRepository>((ref) {
  final localDataSource = ref.watch(newsPublishLocalDataSourceProvider);
  final remoteDataSource = ref.watch(newsPublishRemoteDataSourceProvider);
  return NewsPublishRepositoryImpl(remoteDataSource, localDataSource);
});
