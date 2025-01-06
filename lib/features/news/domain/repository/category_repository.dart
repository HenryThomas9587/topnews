import 'package:topnews/features/news/domain/entity/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<CategoryEntity?> getCategoryById(String id);
  Future<void> refreshCategories();
}
