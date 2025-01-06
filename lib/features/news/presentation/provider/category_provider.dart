import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/data/repository/category_repository_impl.dart';
import 'package:topnews/features/news/domain/entity/category_entity.dart';

part 'category_provider.g.dart';

@riverpod
class Categories extends _$Categories {
  @override
  Future<List<CategoryEntity>> build() async {
    final repository = ref.watch(categoryRepositoryProvider);
    final categories = await repository.getCategories();
    return [
      const CategoryEntity(id: 0, name: 'all', label: 'All'),
      ...categories.where((c) => c.isActive),
    ];
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repository = ref.read(categoryRepositoryProvider);
    await repository.refreshCategories();
    state = await AsyncValue.guard(() => build());
  }
}

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  int build() => 0;

  void select(int id) => state = id;
}
