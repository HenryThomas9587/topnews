import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';
import 'package:topnews/features/profile/domain/usecase/profile_usecase.dart';

part 'profile_provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  Future<UserProfileEntity> build(String userId) {
    return ref.watch(getProfileUseCaseProvider).execute(userId);
  }

  Future<void> updateProfile(UserProfileEntity profile) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(updateProfileUseCaseProvider).execute(profile);
      return profile;
    });
  }

  Future<void> uploadAvatar(String filePath) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final url = await ref.read(uploadAvatarUseCaseProvider).execute(filePath);
      final current = await future;
      final updated = UserProfileEntity(
        id: current.id,
        fullName: current.fullName,
        username: current.username,
        bio: current.bio,
        avatarUrl: url,
        website: current.website,
        stories: current.stories,
        followers: current.followers,
        following: current.following,
      );
      await ref.read(updateProfileUseCaseProvider).execute(updated);
      return updated;
    });
  }
}
