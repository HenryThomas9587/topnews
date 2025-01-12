import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:topnews/features/news/domain/entity/news_draft_entity.dart';

part 'news_draft_model.freezed.dart';
part 'news_draft_model.g.dart';

@freezed
@HiveType(typeId: 3)
class NewsDraftModel with _$NewsDraftModel {
  const factory NewsDraftModel({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required String content,
    @HiveField(3) @Default([]) List<String> images,
    @HiveField(4) @Default('') String category,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) @Default(true) bool isDraft,
  }) = _NewsDraftModel;

  factory NewsDraftModel.fromEntity(NewsDraftEntity entity) {
    return NewsDraftModel(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      images: entity.images,
      category: entity.category,
      createdAt: entity.createdAt,
      isDraft: entity.isDraft,
    );
  }

  NewsDraftEntity toEntity() {
    return NewsDraftEntity(
      id: id,
      title: title,
      content: content,
      images: images,
      category: category,
      createdAt: createdAt,
      isDraft: isDraft,
    );
  }

  const NewsDraftModel._();

  factory NewsDraftModel.fromJson(Map<String, dynamic> json) =>
      _$NewsDraftModelFromJson(json);
}
