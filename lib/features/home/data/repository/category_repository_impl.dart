import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/home/domain/repository/category_repository.dart';

part 'category_repository_impl.g.dart';

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  return CategoryRepositoryImpl();
}

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<List<String>> getCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return ['Technology', 'Science', 'Health', 'Business', 'Entertainment'];
  }
}
