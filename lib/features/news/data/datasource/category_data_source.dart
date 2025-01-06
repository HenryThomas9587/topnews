import 'package:topnews/features/news/data/model/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<CategoryModel?> getCategoryById(String id);
}

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getCachedCategories();
  Future<CategoryModel?> getCategoryById(String id);
  Future<void> cacheCategories(List<CategoryModel> categories);
  Future<void> clearCache();
}
