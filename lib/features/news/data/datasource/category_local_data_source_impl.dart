import 'package:hive_flutter/hive_flutter.dart';
import 'package:topnews/features/news/data/datasource/category_data_source.dart';
import 'package:topnews/features/news/data/model/category_model.dart';

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final Box<CategoryModel> _box;

  CategoryLocalDataSourceImpl(this._box);

  @override
  Future<List<CategoryModel>> getCachedCategories() async {
    return _box.values.toList();
  }

  @override
  Future<CategoryModel?> getCategoryById(String id) async {
    final categories = await getCachedCategories();
    return categories.firstWhere(
      (category) => category.name == id,
      orElse: () => throw Exception('Category not found'),
    );
  }

  @override
  Future<void> cacheCategories(List<CategoryModel> categories) async {
    await _box.clear();
    await _box.addAll(categories);
  }

  @override
  Future<void> clearCache() async {
    await _box.clear();
  }
}
