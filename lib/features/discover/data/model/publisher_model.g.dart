// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublisherModelImpl _$$PublisherModelImplFromJson(Map<String, dynamic> json) =>
    _$PublisherModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      isFollowing: json['isFollowing'] as bool? ?? false,
    );

Map<String, dynamic> _$$PublisherModelImplToJson(
        _$PublisherModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'isFollowing': instance.isFollowing,
    };
