import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topnews/features/news/data/model/comment_model.dart';

part 'news_entity.freezed.dart';

@freezed
class NewsEntity with _$NewsEntity {
  const factory NewsEntity({
    required String id,
    required String title,
    required String content,
    required DateTime publishedAt,
    String? imageUrl,
    String? thumbnailUrl,
    int? userId,
    @Default([]) List<CommentModel> comments,
  }) = _NewsEntity;
}
