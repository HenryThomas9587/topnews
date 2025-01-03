import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topnews/features/news/data/model/comment_model.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'dart:convert';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    required String id,
    required String title,
    required String content,
    String? imageUrl,
    String? thumbnailUrl,
    int? userId,
    @Default(0) int commentCount,
    @Default([]) List<CommentModel> comments,
    @Default(null) DateTime? publishedAt,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson({
        ...json,
        'id': json['id'].toString(),
      });

  const NewsModel._();

  NewsEntity toEntity() => NewsEntity(
        id: id,
        title: title,
        content: content,
        publishedAt: publishedAt ?? DateTime.now(),
        imageUrl: imageUrl,
        thumbnailUrl: thumbnailUrl,
        userId: userId,
      );

  static List<NewsModel> listFromJson(String str) => (json.decode(str) as List)
      .map((x) => NewsModel.fromJson(x as Map<String, dynamic>))
      .toList();

  static String listToJson(List<NewsModel> data) =>
      json.encode(data.map((x) => x.toJson()).toList());
}
