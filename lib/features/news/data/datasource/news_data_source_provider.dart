import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/storage/hive_storage.dart';
import 'package:topnews/features/news/data/datasource/news_data_source.dart';
import 'package:topnews/features/news/data/datasource/news_local_data_source_impl.dart';
import 'package:topnews/features/news/data/datasource/news_remote_data_source_impl.dart';
import 'package:topnews/features/news/data/model/news_model.dart';

part 'news_data_source_provider.g.dart';

@riverpod
NewsRemoteDataSource newsRemoteDataSource(Ref ref) {
  return NewsRemoteDataSourceImpl();
}

@riverpod
NewsLocalDataSource newsLocalDataSource(Ref ref) {
  final box = Hive.box<NewsModel>(HiveStorage.newsBox);
  return NewsLocalDataSourceImpl(box);
}
