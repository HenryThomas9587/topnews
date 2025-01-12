// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorModelImpl _$$AuthorModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthorModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      isFollowing: json['isFollowing'] as bool? ?? false,
      userType: json['userType'] as String? ?? '',
    );

Map<String, dynamic> _$$AuthorModelImplToJson(_$AuthorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'isFollowing': instance.isFollowing,
      'userType': instance.userType,
    };
