import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/data/datasource/category_data_source.dart';
import 'package:topnews/features/news/data/datasource/category_data_source_provider.dart';
import 'package:topnews/features/news/domain/entity/category_entity.dart';
import 'package:topnews/features/news/domain/repository/category_repository.dart';

part 'category_repository_impl.g.dart';

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  return CategoryRepositoryImpl(
    remoteDataSource: ref.read(categoryRemoteDataSourceProvider),
    localDataSource: ref.read(categoryLocalDataSourceProvider),
  );
}

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final CategoryLocalDataSource localDataSource;

  CategoryRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      await localDataSource.cacheCategories(categories);
      return categories.map((model) => model.toEntity()).toList();
    } catch (e) {
      try {
        final cached = await localDataSource.getCachedCategories();
        return cached.map((model) => model.toEntity()).toList();
      } catch (e) {
        return [];
      }
    }
  }

  @override
  Future<CategoryEntity?> getCategoryById(String id) async {
    try {
      final category = await remoteDataSource.getCategoryById(id);
      return category?.toEntity();
    } catch (e) {
      try {
        final cached = await localDataSource.getCategoryById(id);
        return cached?.toEntity();
      } catch (e) {
        return null;
      }
    }
  }

  @override
  Future<void> refreshCategories() async {
    await localDataSource.clearCache();
    await getCategories();
  }
}
