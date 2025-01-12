import 'package:topnews/features/discover/domain/entity/publisher_entity.dart';

abstract class PublisherRepository {
  Future<List<PublisherEntity>> getFollowedPublishers(int page, int pageSize);
  Future<List<PublisherEntity>> getRecommendedPublishers(
      int page, int pageSize);
  Future<List<PublisherEntity>> searchPublishers(
      int page, int pageSize, String keyword);
  Future<void> toggleFollow(String publisherId, bool isFollowing);
  Future<void> followPublisher(String publisherId);
  Future<void> unfollowPublisher(String publisherId);
}
