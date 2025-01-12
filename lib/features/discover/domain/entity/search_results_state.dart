import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topnews/features/discover/domain/entity/search_type.dart';

part 'search_results_state.freezed.dart';

@freezed
class SearchResultsState with _$SearchResultsState {
  const factory SearchResultsState({
    @Default('') String query,
    @Default(SearchType.stories) SearchType activeTab,
  }) = _SearchResultsState;
}
