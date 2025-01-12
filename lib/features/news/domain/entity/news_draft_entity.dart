import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_draft_entity.freezed.dart';

@freezed
class NewsDraftEntity with _$NewsDraftEntity {
  const factory NewsDraftEntity({
    required String id,
    required String title,
    required String content,
    @Default([]) List<String> images,
    @Default('') String category,
    required DateTime createdAt,
    @Default(true) bool isDraft,
  }) = _NewsDraftEntity;
}
