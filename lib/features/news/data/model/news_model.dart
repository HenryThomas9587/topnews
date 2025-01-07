import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
@HiveType(typeId: 1)
class NewsModel with _$NewsModel {
  const factory NewsModel({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) String? subtitle,
    @HiveField(3) required String content,
    @HiveField(4) required DateTime publishedAt,
    @HiveField(5) String? imageUrl,
    @HiveField(6) String? cover,
    @HiveField(7) String? author,
    @HiveField(8) String? authorAvatar,
    @HiveField(9) String? category,
    @HiveField(10) int? categoryId,
    @HiveField(11) @Default(0) int readTime,
    @HiveField(12) @Default(0) int likes,
    @HiveField(13) @Default(0) int views,
    @HiveField(14) @Default(0) int comments,
    @HiveField(15) @Default(false) bool isFavorite,
  }) = _NewsModel;

  factory NewsModel.fromEntity(NewsEntity entity) {
    return NewsModel(
      id: entity.id,
      title: entity.title,
      subtitle: entity.subtitle,
      content: entity.content,
      publishedAt: entity.publishedAt,
      imageUrl: entity.imageUrl,
      cover: entity.cover,
      author: entity.author,
      authorAvatar: entity.authorAvatar,
      category: entity.category,
      categoryId: entity.categoryId,
      readTime: entity.readTime,
      likes: entity.likes,
      views: entity.views,
      comments: entity.comments,
      isFavorite: entity.isFavorite,
    );
  }

  NewsEntity toEntity() {
    return NewsEntity(
      id: id,
      title: title,
      subtitle: subtitle ?? '',
      content: content,
      imageUrl: imageUrl ?? '',
      cover: cover ?? '',
      publishedAt: publishedAt,
      author: author ?? '',
      authorAvatar: authorAvatar ?? '',
      category: category ?? '',
      categoryId: categoryId ?? 0,
      readTime: readTime,
      likes: likes,
      views: views,
      comments: comments,
      isFavorite: isFavorite,
    );
  }

  const NewsModel._();

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
