import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:topnews/core/constant/app_constants.dart';
import 'package:topnews/features/news/data/datasource/news_api_client.dart';

void main() {
  late NewsApiClient apiClient;

  setUp(() {
    final dio = Dio(BaseOptions(
      baseUrl: AppConstants.newsApiBaseUrl,
    ));
    apiClient = NewsApiClient(dio);
  });

  group('NewsApiClient Integration Tests', () {
    test('getPosts should return list of posts', () async {
      final posts = await apiClient.getPosts();
      expect(posts, isNotEmpty);
      expect(posts.first.title, isNotEmpty);
    });

    test('getPhotos should return list of photos', () async {
      final photos = await apiClient.getPhotos();
      expect(photos, isNotEmpty);
      expect(photos.first.url, isNotEmpty);
    });

    test('getPost should return single post', () async {
      final post = await apiClient.getPost('1');
      expect(post.id, 1);
      expect(post.title, isNotEmpty);
    });
  });
}
