import 'package:topnews/features/discover/domain/entity/search_history_entity.dart';

abstract class SearchRepository {
  Future<List<SearchHistoryEntity>> getSearchHistory();
  Future<void> addSearchHistory(String keyword);
  Future<void> removeSearchHistory(String id);
  Future<void> clearSearchHistory();
}
