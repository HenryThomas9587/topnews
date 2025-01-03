import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/network/dio_provider.dart';
import 'package:topnews/features/news/data/datasource/news_api_client.dart';
import 'package:topnews/features/news/data/datasource/news_remote_data_source.dart';
import 'package:topnews/features/news/data/model/comment_model.dart';
import 'package:topnews/features/news/data/model/news_model.dart';
import 'package:topnews/features/news/data/model/photo_model.dart';
import 'package:topnews/features/news/data/model/post_model.dart';

part 'news_remote_data_source_impl.g.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  NewsRemoteDataSourceImpl(this._apiClient);

  final NewsApiClient _apiClient;

  @override
  Future<List<NewsModel>> getNewsList() async {
    // 只并行请求文章和图片
    final results = await Future.wait([
      _apiClient.getPosts(),
      _apiClient.getPhotos(),
    ]);

    final posts = results[0] as List<PostModel>;
    final photos = results[1] as List<PhotoModel>;

    // 直接合并结果，不加载评论
    return List.generate(posts.length, (index) {
      final post = posts[index];
      final photo = photos[post.id % photos.length];

      return NewsModel(
        id: post.id.toString(),
        title: post.title,
        content: post.body,
        userId: post.userId,
        imageUrl: photo.url,
        thumbnailUrl: photo.thumbnailUrl,
      );
    });
  }

  @override
  Future<NewsModel> getNewsDetail(String id) async {
    // 并行请求文章详情、图片列表和评论
    final results = await Future.wait([
      _apiClient.getPost(id),
      _apiClient.getPhotos(),
      _apiClient.getPostComments(id),
    ]);

    final post = results[0] as PostModel;
    final photos = results[1] as List<PhotoModel>;
    final comments = results[2] as List<CommentModel>;

    final photo = photos[post.id % photos.length];

    return NewsModel(
      id: post.id.toString(),
      title: post.title,
      content: post.body,
      userId: post.userId,
      imageUrl: photo.url,
      thumbnailUrl: photo.thumbnailUrl,
      commentCount: comments.length,
      comments: comments,
    );
  }
}

@riverpod
NewsRemoteDataSource newsRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  final apiClient = NewsApiClient(dio);
  return NewsRemoteDataSourceImpl(apiClient);
}
