import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:topnews/core/constant/app_constants.dart';
import 'package:topnews/features/news/data/model/post_model.dart';
import 'package:topnews/features/news/data/model/photo_model.dart';
import 'package:topnews/features/news/data/model/comment_model.dart';

part 'news_api_client.g.dart';

@RestApi(baseUrl: AppConstants.newsApiBaseUrl)
abstract class NewsApiClient {
  factory NewsApiClient(Dio dio, {String? baseUrl}) = _NewsApiClient;

  @GET('/posts')
  Future<List<PostModel>> getPosts();

  @GET('/photos')
  Future<List<PhotoModel>> getPhotos();

  @GET('/posts/{id}')
  Future<PostModel> getPost(@Path() String id);

  @GET('/posts/{id}/comments')
  Future<List<CommentModel>> getPostComments(@Path() String id);

  @GET('/albums/{id}/photos')
  Future<List<PhotoModel>> getAlbumPhotos(@Path() String id);

  @GET('/users/{id}/posts')
  Future<List<PostModel>> getUserPosts(@Path() String id);
}
