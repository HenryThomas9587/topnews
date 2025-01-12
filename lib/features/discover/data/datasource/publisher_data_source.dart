import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/error/app_error.dart';
import 'package:topnews/features/discover/data/datasource/mock/mock_publisher_data.dart';
import 'package:topnews/features/discover/data/model/publisher_model.dart';

part 'publisher_data_source.g.dart';

abstract class PublisherDataSource {
  Future<List<PublisherModel>> getFollowedPublishers(int page, int pageSize);
  Future<List<PublisherModel>> getRecommendedPublishers(int page, int pageSize);
  Future<List<PublisherModel>> searchPublishers(
      int page, int pageSize, String query);
  Future<void> followPublisher(String publisherId);
  Future<void> unfollowPublisher(String publisherId);
}

class PublisherRemoteDataSource implements PublisherDataSource {
  @override
  Future<List<PublisherModel>> getFollowedPublishers(int page, int pageSize) {
    return Future.value(followedPublishers);
  }

  @override
  Future<List<PublisherModel>> getRecommendedPublishers(
      int page, int pageSize) {
    return Future.value(recommendedPublishers);
  }

  @override
  Future<List<PublisherModel>> searchPublishers(
      int page, int pageSize, String query) {
    return Future.value(getSearchPublisherList(query));
  }

  @override
  Future<void> followPublisher(String publisherId) {
    final result = getFollowedPublisherResult(publisherId, false);
    if (result.code != 200) {
      return Future.error(AppError.custom(result.message));
    }
    return Future.value();
  }

  @override
  Future<void> unfollowPublisher(String publisherId) {
    final result = getFollowedPublisherResult(publisherId, true);
    if (result.code != 200) {
      return Future.error(AppError.custom(result.message));
    }
    return Future.value();
  }
}

@riverpod
PublisherDataSource publisherDataSource(Ref ref) {
  return PublisherRemoteDataSource();
}
