import 'package:topnews/features/profile/data/datasource/profile_data_source.dart';

class ProfileRemoteDataSource implements ProfileDataSource {
  @override
  Future<Map<String, dynamic>> getProfile(String userId) async {
    // TODO: 实现远程API调用
    await Future.delayed(const Duration(seconds: 1));
    return {
      'id': userId,
      'fullName': 'Andrew Ainsley',
      'username': '@andrew_ainsley',
      'bio':
          'Tech enthusiast, likes to share stories about technology and the digital world.',
      'avatarUrl': 'https://picsum.photos/200',
      'website': 'www.andrewainsley.com/blog',
      'stories': 126,
      'followers': 4259,
      'following': 145,
    };
  }

  @override
  Future<void> updateProfile(Map<String, dynamic> profile) async {
    // TODO: 实现远程API调用
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<String> uploadAvatar(String filePath) async {
    // TODO: 实现文件上传
    await Future.delayed(const Duration(seconds: 2));
    return 'https://picsum.photos/200';
  }
}
