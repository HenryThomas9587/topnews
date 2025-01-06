import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/storage/hive_storage.dart';
import 'package:topnews/features/news/data/datasource/category_data_source.dart';
import 'package:topnews/features/news/data/datasource/category_local_data_source_impl.dart';
import 'package:topnews/features/news/data/datasource/category_remote_data_source_impl.dart';
import 'package:topnews/features/news/data/model/category_model.dart';

part 'category_data_source_provider.g.dart';

@riverpod
CategoryRemoteDataSource categoryRemoteDataSource(Ref ref) {
  return CategoryRemoteDataSourceImpl();
}

@riverpod
CategoryLocalDataSource categoryLocalDataSource(Ref ref) {
  final box = Hive.box<CategoryModel>(HiveStorage.categoriesBox);
  return CategoryLocalDataSourceImpl(box);
}
