import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topnews/features/discover/domain/entity/tag_entity.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

@freezed
class TagModel with _$TagModel {
  const factory TagModel({
    required String id,
    required String name,
    required String label,
    required int newsCount,
    required bool isFollowed,
  }) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);
}

extension TagModelX on TagModel {
  TagEntity toEntity() {
    return TagEntity(
      id: id,
      name: name,
      label: label,
      newsCount: newsCount,
      isFollowed: isFollowed,
    );
  }
}
