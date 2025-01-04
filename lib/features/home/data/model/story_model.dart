import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topnews/features/home/domain/entity/story_entity.dart';

part 'story_model.freezed.dart';
part 'story_model.g.dart';

@freezed
class StoryModel with _$StoryModel {
  const factory StoryModel({
    required String id,
    required String title,
    required String content,
    required String imageUrl,
    required String author,
    required String authorAvatar,
    required DateTime publishedAt,
    required int readTime,
    required int likes,
    required int comments,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  factory StoryModel.fromEntity(StoryEntity entity) => StoryModel(
        id: entity.id,
        title: entity.title,
        content: entity.content,
        imageUrl: entity.imageUrl,
        author: entity.author,
        authorAvatar: entity.authorAvatar,
        publishedAt: entity.publishedAt,
        readTime: entity.readTime,
        likes: entity.likes,
        comments: entity.comments,
      );
}

extension StoryModelX on StoryModel {
  StoryEntity toEntity() => StoryEntity(
        id: id,
        title: title,
        content: content,
        imageUrl: imageUrl,
        author: author,
        authorAvatar: authorAvatar,
        publishedAt: publishedAt,
        readTime: readTime,
        likes: likes,
        comments: comments,
      );
}
