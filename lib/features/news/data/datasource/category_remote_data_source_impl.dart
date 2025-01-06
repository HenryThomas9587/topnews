import 'package:topnews/features/news/data/datasource/category_data_source.dart';
import 'package:topnews/features/news/data/datasource/mock/mock_category_data_sets.dart';
import 'package:topnews/features/news/data/model/category_model.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return MockCategoryDataSets.categories
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }

  @override
  Future<CategoryModel?> getCategoryById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final json = MockCategoryDataSets.categories
          .firstWhere((category) => category['id'] == id);
      return CategoryModel.fromJson(json);
    } catch (e) {
      return null;
    }
  }
}
