import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/profile/data/datasource/profile_data_source.dart';
import 'package:topnews/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:topnews/features/profile/data/model/user_profile_model.dart';
import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';
import 'package:topnews/features/profile/domain/repository/profile_repository.dart';

part 'profile_repository_impl.g.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<UserProfileEntity> getProfile(String userId) async {
    final json = await dataSource.getProfile(userId);
    return UserProfileModel.fromJson(json).toEntity();
  }

  @override
  Future<void> updateProfile(UserProfileEntity profile) async {
    final model = UserProfileModel.fromEntity(profile);
    await dataSource.updateProfile(model.toJson());
  }

  @override
  Future<String> uploadAvatar(String filePath) {
    return dataSource.uploadAvatar(filePath);
  }
}

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepositoryImpl(ProfileRemoteDataSource());
}
