import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_entity.freezed.dart';

@freezed
class TagEntity with _$TagEntity {
  const factory TagEntity({
    required String id,
    required String name,
    required String label,
    required int newsCount,
    @Default(false) bool isFollowed,
  }) = _TagEntity;

  const TagEntity._();
}
