import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/domain/entity/search_results_state.dart';
import 'package:topnews/features/discover/domain/entity/search_type.dart';

part 'search_results_provider.g.dart';

@riverpod
class SearchResultsNotifier extends _$SearchResultsNotifier {
  @override
  SearchResultsState build(String initialQuery) {
    return SearchResultsState(query: initialQuery);
  }

  void search(String query) {
    state = state.copyWith(query: query);
  }

  void changeTab(SearchType tab) {
    state = state.copyWith(activeTab: tab);
  }
}
