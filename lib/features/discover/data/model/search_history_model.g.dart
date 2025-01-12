// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchHistoryModelImpl _$$SearchHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchHistoryModelImpl(
      id: json['id'] as String,
      keyword: json['keyword'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$SearchHistoryModelImplToJson(
        _$SearchHistoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'keyword': instance.keyword,
      'createdAt': instance.createdAt.toIso8601String(),
    };
