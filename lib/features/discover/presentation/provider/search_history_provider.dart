import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/data/repository/search_repository_impl.dart';
import 'package:topnews/features/discover/domain/entity/search_history_entity.dart';

part 'search_history_provider.g.dart';

@riverpod
class SearchHistoryNotifier extends _$SearchHistoryNotifier {
  @override
  Future<List<SearchHistoryEntity>> build() => _fetchSearchHistory();

  Future<List<SearchHistoryEntity>> _fetchSearchHistory() async {
    final repository = ref.read(searchRepositoryProvider);
    return repository.getSearchHistory();
  }

  Future<void> addSearchHistory(String keyword) async {
    final repository = ref.read(searchRepositoryProvider);
    await repository.addSearchHistory(keyword);
    ref.invalidateSelf();
  }

  Future<void> removeSearchHistory(String id) async {
    final repository = ref.read(searchRepositoryProvider);
    await repository.removeSearchHistory(id);
    ref.invalidateSelf();
  }

  Future<void> clearSearchHistory() async {
    final repository = ref.read(searchRepositoryProvider);
    await repository.clearSearchHistory();
    ref.invalidateSelf();
  }
}
