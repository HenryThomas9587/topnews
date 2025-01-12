// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagModelImpl _$$TagModelImplFromJson(Map<String, dynamic> json) =>
    _$TagModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      label: json['label'] as String,
      newsCount: (json['newsCount'] as num).toInt(),
      isFollowed: json['isFollowed'] as bool,
    );

Map<String, dynamic> _$$TagModelImplToJson(_$TagModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'newsCount': instance.newsCount,
      'isFollowed': instance.isFollowed,
    };
