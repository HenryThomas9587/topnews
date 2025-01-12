// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_draft_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsDraftModelAdapter extends TypeAdapter<NewsDraftModel> {
  @override
  final int typeId = 3;

  @override
  NewsDraftModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsDraftModel(
      id: fields[0] as String,
      title: fields[1] as String,
      content: fields[2] as String,
      images: (fields[3] as List).cast<String>(),
      category: fields[4] as String,
      createdAt: fields[5] as DateTime,
      isDraft: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NewsDraftModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.images)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.isDraft);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsDraftModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsDraftModelImpl _$$NewsDraftModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsDraftModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      category: json['category'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      isDraft: json['isDraft'] as bool? ?? true,
    );

Map<String, dynamic> _$$NewsDraftModelImplToJson(
        _$NewsDraftModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'images': instance.images,
      'category': instance.category,
      'createdAt': instance.createdAt.toIso8601String(),
      'isDraft': instance.isDraft,
    };
