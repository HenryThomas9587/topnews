import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/data/datasource/tag_data_source.dart';
import 'package:topnews/features/discover/data/model/tag_model.dart';
import 'package:topnews/features/discover/domain/entity/tag_entity.dart';
import 'package:topnews/features/discover/domain/repository/tag_repository.dart';

part 'tag_repository_impl.g.dart';

class TagRepositoryImpl implements TagRepository {
  final TagDataSource _dataSource;

  TagRepositoryImpl(this._dataSource);

  @override
  Future<List<TagEntity>> getFollowedTags(int page, int pageSize) async {
    final tags = await _dataSource.getFollowedTags(page, pageSize);
    return tags.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<TagEntity>> getRecommendedTags(int page, int pageSize) async {
    final tags = await _dataSource.getRecommendedTags(page, pageSize);
    return tags.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<TagEntity>> getLatestTags(int page, int pageSize) async {
    final tags = await _dataSource.getLatestTags(page, pageSize);
    return tags.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<TagEntity>> getTrendingTags(int page, int pageSize) async {
    final tags = await _dataSource.getTrendingTags(page, pageSize);
    return tags.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<TagEntity>> searchTags(
      int page, int pageSize, String query) async {
    final tags = await _dataSource.searchTags(page, pageSize, query);
    return tags.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<TagEntity>> getCategoryTags(
      int page, int pageSize, String query) async {
    final tags = await _dataSource.getCategoryTags(page, pageSize, query);
    return tags.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> followTag(String tagId) async {
    await _dataSource.followTag(tagId);
  }

  @override
  Future<void> unfollowTag(String tagId) async {
    await _dataSource.unfollowTag(tagId);
  }
}

@riverpod
TagRepository tagRepository(Ref ref) {
  final dataSource = ref.watch(tagDataSourceProvider);
  return TagRepositoryImpl(dataSource);
}
