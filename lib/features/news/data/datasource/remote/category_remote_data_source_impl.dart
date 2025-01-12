import 'package:topnews/features/news/data/datasource/category_data_source.dart';
import 'package:topnews/features/news/data/datasource/mock/mock_category_data_sets.dart';
import 'package:topnews/features/news/data/model/category_model.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    Future.delayed(const Duration(milliseconds: 800));
    return MockCategoryDataSets.categories;
  }

  @override
  Future<CategoryModel?> getCategoryById(String id) async {
    Future.delayed(const Duration(milliseconds: 500));
    return MockCategoryDataSets.categories
        .firstWhere((category) => category.id.toString() == id);
  }
}
