import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/profile/data/repository/profile_repository_impl.dart';
import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';
import 'package:topnews/features/profile/domain/repository/profile_repository.dart';

part 'profile_usecase.g.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<UserProfileEntity> execute(String userId) {
    return repository.getProfile(userId);
  }
}

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<void> execute(UserProfileEntity profile) {
    return repository.updateProfile(profile);
  }
}

class UploadAvatarUseCase {
  final ProfileRepository repository;

  UploadAvatarUseCase(this.repository);

  Future<String> execute(String filePath) {
    return repository.uploadAvatar(filePath);
  }
}

@riverpod
GetProfileUseCase getProfileUseCase(Ref ref) {
  return GetProfileUseCase(ref.watch(profileRepositoryProvider));
}

@riverpod
UpdateProfileUseCase updateProfileUseCase(Ref ref) {
  return UpdateProfileUseCase(ref.watch(profileRepositoryProvider));
}

@riverpod
UploadAvatarUseCase uploadAvatarUseCase(Ref ref) {
  return UploadAvatarUseCase(ref.watch(profileRepositoryProvider));
}
