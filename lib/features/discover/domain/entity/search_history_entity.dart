import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history_entity.freezed.dart';

@freezed
class SearchHistoryEntity with _$SearchHistoryEntity {
  const factory SearchHistoryEntity({
    required String id,
    required String keyword,
    required DateTime createdAt,
  }) = _SearchHistoryEntity;
}

