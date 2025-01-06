abstract class ProfileDataSource {
  Future<Map<String, dynamic>> getProfile(String userId);
  Future<void> updateProfile(Map<String, dynamic> profile);
  Future<String> uploadAvatar(String filePath);
}
