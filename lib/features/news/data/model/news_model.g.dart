// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsModelAdapter extends TypeAdapter<NewsModel> {
  @override
  final int typeId = 1;

  @override
  NewsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsModel(
      id: fields[0] as String,
      title: fields[1] as String,
      content: fields[2] as String,
      categoryId: fields[3] as int?,
      category: fields[4] as String?,
      publishedAt: fields[5] as DateTime,
      imageUrl: fields[6] as String?,
      author: fields[7] as String?,
      authorAvatar: fields[8] as String?,
      readTime: fields[9] as int,
      likes: fields[10] as int,
      views: fields[11] as int,
      comments: fields[12] as int,
      isFavorite: fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NewsModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.categoryId)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.publishedAt)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.author)
      ..writeByte(8)
      ..write(obj.authorAvatar)
      ..writeByte(9)
      ..write(obj.readTime)
      ..writeByte(10)
      ..write(obj.likes)
      ..writeByte(11)
      ..write(obj.views)
      ..writeByte(12)
      ..write(obj.comments)
      ..writeByte(13)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      category: json['category'] as String?,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      imageUrl: json['imageUrl'] as String?,
      author: json['author'] as String?,
      authorAvatar: json['authorAvatar'] as String?,
      readTime: (json['readTime'] as num?)?.toInt() ?? 0,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      views: (json['views'] as num?)?.toInt() ?? 0,
      comments: (json['comments'] as num?)?.toInt() ?? 0,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'categoryId': instance.categoryId,
      'category': instance.category,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'author': instance.author,
      'authorAvatar': instance.authorAvatar,
      'readTime': instance.readTime,
      'likes': instance.likes,
      'views': instance.views,
      'comments': instance.comments,
      'isFavorite': instance.isFavorite,
    };
