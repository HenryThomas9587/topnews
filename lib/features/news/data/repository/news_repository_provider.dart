import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/data/datasource/news_data_source_provider.dart';
import 'package:topnews/features/news/data/repository/news_repository_impl.dart';
import 'package:topnews/features/news/domain/repository/news_repository.dart';
import 'package:topnews/features/news/data/datasource/news_remote_data_source_impl.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final localDataSource = ref.watch(newsLocalDataSourceProvider);
  return NewsRepositoryImpl(
    remoteDataSource: NewsRemoteDataSourceImpl(),
    localDataSource: localDataSource,
  );
});
