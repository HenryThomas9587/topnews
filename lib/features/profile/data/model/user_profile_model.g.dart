// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      username: json['username'] as String,
      bio: json['bio'] as String,
      avatarUrl: json['avatarUrl'] as String,
      website: json['website'] as String? ?? '',
      stories: (json['stories'] as num?)?.toInt() ?? 0,
      followers: (json['followers'] as num?)?.toInt() ?? 0,
      following: (json['following'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'username': instance.username,
      'bio': instance.bio,
      'avatarUrl': instance.avatarUrl,
      'website': instance.website,
      'stories': instance.stories,
      'followers': instance.followers,
      'following': instance.following,
    };
