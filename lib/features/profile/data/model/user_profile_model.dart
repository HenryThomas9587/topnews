import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required String id,
    required String fullName,
    required String username,
    required String bio,
    required String avatarUrl,
    @Default('') String website,
    @Default(0) int stories,
    @Default(0) int followers,
    @Default(0) int following,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  factory UserProfileModel.fromEntity(UserProfileEntity entity) =>
      UserProfileModel(
        id: entity.id,
        fullName: entity.fullName,
        username: entity.username,
        bio: entity.bio,
        avatarUrl: entity.avatarUrl,
        website: entity.website,
        stories: entity.stories,
        followers: entity.followers,
        following: entity.following,
      );
}

extension UserProfileModelX on UserProfileModel {
  UserProfileEntity toEntity() => UserProfileEntity(
        id: id,
        fullName: fullName,
        username: username,
        bio: bio,
        avatarUrl: avatarUrl,
        website: website,
        stories: stories,
        followers: followers,
        following: following,
      );
}
