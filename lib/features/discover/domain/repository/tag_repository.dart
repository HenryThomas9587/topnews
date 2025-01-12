import 'package:topnews/features/discover/domain/entity/tag_entity.dart';

abstract class TagRepository {
  Future<List<TagEntity>> getFollowedTags(int page, int pageSize);
  Future<List<TagEntity>> getRecommendedTags(int page, int pageSize);
  Future<List<TagEntity>> getTrendingTags(int page, int pageSize);
  Future<List<TagEntity>> getLatestTags(int page, int pageSize);
  Future<List<TagEntity>> getCategoryTags(int page, int pageSize, String query);
  Future<List<TagEntity>> searchTags(int page, int pageSize, String query);
  Future<void> followTag(String tagId);
  Future<void> unfollowTag(String tagId);
}
