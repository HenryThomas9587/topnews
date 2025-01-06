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
    @HiveField(2) required String content,
    @HiveField(3) int? categoryId,
    @HiveField(4) String? category,
    @HiveField(5) required DateTime publishedAt,
    @HiveField(6) String? imageUrl,
    @HiveField(7) String? author,
    @HiveField(8) String? authorAvatar,
    @HiveField(9) @Default(0) int readTime,
    @HiveField(10) @Default(0) int likes,
    @HiveField(11) @Default(0) int views,
    @HiveField(12) @Default(0) int comments,
    @HiveField(13) @Default(false) bool isFavorite,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  const NewsModel._();

  NewsEntity toEntity() {
    return NewsEntity(
      id: id,
      title: title,
      content: content,
      categoryId: categoryId,
      category: category,
      publishedAt: publishedAt,
      imageUrl: imageUrl,
      author: author,
      authorAvatar: authorAvatar,
      readTime: readTime,
      likes: likes,
      views: views,
      comments: comments,
      isFavorite: isFavorite,
    );
  }

  static NewsModel fromEntity(NewsEntity entity) {
    return NewsModel(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      categoryId: entity.categoryId,
      category: entity.category,
      publishedAt: entity.publishedAt,
      imageUrl: entity.imageUrl,
      author: entity.author,
      authorAvatar: entity.authorAvatar,
      readTime: entity.readTime,
      likes: entity.likes,
      views: entity.views,
      comments: entity.comments,
      isFavorite: entity.isFavorite,
    );
  }
}
