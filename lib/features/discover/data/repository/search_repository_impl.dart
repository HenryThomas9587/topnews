import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/data/datasource/mock/mock_search_data.dart';
import 'package:topnews/features/discover/data/model/search_history_model.dart';
import 'package:topnews/features/discover/domain/entity/search_history_entity.dart';
import 'package:topnews/features/discover/domain/repository/search_repository.dart';

part 'search_repository_impl.g.dart';

class SearchRepositoryImpl implements SearchRepository {
  final MockSearchData _mockSearchData = MockSearchData();

  @override
  Future<List<SearchHistoryEntity>> getSearchHistory() async {
    final histories = _mockSearchData.getSearchHistory();
    return histories.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> addSearchHistory(String keyword) async {
    _mockSearchData.addSearchHistory(keyword);
  }

  @override
  Future<void> removeSearchHistory(String id) async {
    _mockSearchData.removeSearchHistory(id);
  }

  @override
  Future<void> clearSearchHistory() async {
    _mockSearchData.searchHistoryList.clear();
  }
}

@riverpod
SearchRepository searchRepository(Ref ref) {
  return SearchRepositoryImpl();
}
