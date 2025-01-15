import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/util/logger.dart';
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
    try {
      state = await AsyncValue.guard(() async {
        final url =
            await ref.read(uploadAvatarUseCaseProvider).execute(filePath);
        final updated = UserProfileEntity(
          id: state.value?.id ?? '',
          fullName: state.value?.fullName ?? '',
          username: state.value?.username ?? '',
          bio: state.value?.bio ?? '',
          avatarUrl: url,
          website: state.value?.website ?? '',
          stories: state.value?.stories ?? 0,
          followers: state.value?.followers ?? 0,
          following: state.value?.following ?? 0,
        );
        await ref.read(updateProfileUseCaseProvider).execute(updated);
        return updated;
      });
    } catch (e, stack) {
      // 记录错误日志
      logError("Error uploading avatar: $e", stack);
      // 更新状态为错误
      state = AsyncValue.error(e, stack);
    }
  }
}
