import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/error/app_error.dart';
import 'package:topnews/features/discover/data/datasource/mock/mock_tag_data.dart';
import 'package:topnews/features/discover/data/model/tag_model.dart';

part 'tag_data_source.g.dart';

abstract class TagDataSource {
  Future<List<TagModel>> getFollowedTags(int page, int pageSize);
  Future<List<TagModel>> getRecommendedTags(int page, int pageSize);
  Future<List<TagModel>> getCategoryTags(int page, int pageSize, String query);
  Future<List<TagModel>> getLatestTags(int page, int pageSize);
  Future<List<TagModel>> getTrendingTags(int page, int pageSize);
  Future<List<TagModel>> searchTags(int page, int pageSize, String query);
  Future<void> followTag(String tagId);
  Future<void> unfollowTag(String tagId);
}

class TagRemoteDataSourceImpl implements TagDataSource {
  final MockTagDataSource mockTagDataSource = MockTagDataSource();

  @override
  Future<List<TagModel>> getFollowedTags(int page, int pageSize) {
    return Future.value(mockTagDataSource.getFollowedTagList());
  }

  @override
  Future<List<TagModel>> getRecommendedTags(int page, int pageSize) {
    return Future.value(mockTagDataSource.getRecommendedTagList());
  }

  @override
  Future<List<TagModel>> getCategoryTags(int page, int pageSize, String query) {
    return Future.value(mockTagDataSource.getCategoryTagList(query));
  }

  @override
  Future<List<TagModel>> getLatestTags(int page, int pageSize) {
    return Future.value(mockTagDataSource.getLatestTagList());
  }

  @override
  Future<List<TagModel>> getTrendingTags(int page, int pageSize) {
    return Future.value(mockTagDataSource.getTrendingTagList());
  }

  @override
  Future<List<TagModel>> searchTags(int page, int pageSize, String query) {
    return Future.value(mockTagDataSource.getSearchTagList(query));
  }

  @override
  Future<void> followTag(String tagId) {
    final result = mockTagDataSource.getFollowedTagResult(tagId, false);
    if (result.code != 200) {
      return Future.error(AppError.custom(result.message));
    }
    return Future.value();
  }

  @override
  Future<void> unfollowTag(String tagId) {
    final result = mockTagDataSource.getFollowedTagResult(tagId, true);
    if (result.code != 200) {
      return Future.error(AppError.custom(result.message));
    }
    return Future.value();
  }
}

@riverpod
TagDataSource tagDataSource(Ref ref) {
  return TagRemoteDataSourceImpl();
}
