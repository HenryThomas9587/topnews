import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';

abstract class ProfileRepository {
  Future<UserProfileEntity> getProfile(String userId);
  Future<void> updateProfile(UserProfileEntity profile);
  Future<String> uploadAvatar(String filePath);
}
