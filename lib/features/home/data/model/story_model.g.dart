// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryModelImpl _$$StoryModelImplFromJson(Map<String, dynamic> json) =>
    _$StoryModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String,
      author: json['author'] as String,
      authorAvatar: json['authorAvatar'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      readTime: (json['readTime'] as num).toInt(),
      likes: (json['likes'] as num).toInt(),
      comments: (json['comments'] as num).toInt(),
    );

Map<String, dynamic> _$$StoryModelImplToJson(_$StoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
      'author': instance.author,
      'authorAvatar': instance.authorAvatar,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'readTime': instance.readTime,
      'likes': instance.likes,
      'comments': instance.comments,
    };
