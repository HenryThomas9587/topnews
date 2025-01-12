import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/storage/hive_storage.dart';
import 'package:topnews/features/news/data/datasource/local/news_local_publish_data_source_impl.dart';
import 'package:topnews/features/news/data/datasource/news_publish_data_source.dart';
import 'package:topnews/features/news/data/datasource/remote/news_remote_publish_data_source_impl.dart';
import 'package:topnews/features/news/data/model/news_draft_model.dart';

part 'news_publish_source_provider.g.dart';
@riverpod
NewsPublishDataSource newsPublishRemoteDataSource(Ref ref) {
  return NewsPublishRemoteDataSourceImpl();
}

@riverpod
NewsPublishDataSource newsPublishLocalDataSource(Ref ref) {
  final box = Hive.box<NewsDraftModel>(HiveStorage.newsDraftBox);
  return NewsPublishLocalDataSourceImpl(box);
}
