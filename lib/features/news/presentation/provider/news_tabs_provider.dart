import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/data/repository/category_repository_impl.dart';
import 'package:topnews/features/news/domain/entity/category_entity.dart';

part 'news_tabs_provider.g.dart';

@riverpod
class NewsTabsProvider extends _$NewsTabsProvider {
  @override
  AsyncValue<List<CategoryEntity>> build() {
    loadTabs();
    return const AsyncValue.loading();
  }

  Future<void> loadTabs() async {
    state = const AsyncValue.loading();
    final repository = ref.read(categoryRepositoryProvider);

    state = await AsyncValue.guard(() async {
      final categories = await repository.getCategories();
      return [
        const CategoryEntity(id: 0, name: 'All', label: 'All'),
        ...categories.where((c) => c.isActive),
      ];
    });
  }
}
