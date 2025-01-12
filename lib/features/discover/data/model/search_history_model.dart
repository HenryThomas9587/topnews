import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topnews/features/discover/domain/entity/search_history_entity.dart';

part 'search_history_model.freezed.dart';
part 'search_history_model.g.dart';

@freezed
class SearchHistoryModel with _$SearchHistoryModel {
  const factory SearchHistoryModel({
    required String id,
    required String keyword,
    required DateTime createdAt,
  }) = _SearchHistoryModel;

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryModelFromJson(json);
}

extension SearchHistoryModelX on SearchHistoryModel {
  SearchHistoryEntity toEntity() {
    return SearchHistoryEntity(
      id: id,
      keyword: keyword,
      createdAt: createdAt,
    );
  }
}
