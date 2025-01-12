import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/data/datasource/publisher_data_source.dart';
import 'package:topnews/features/discover/data/model/publisher_model.dart';
import 'package:topnews/features/discover/domain/entity/publisher_entity.dart';
import 'package:topnews/features/discover/domain/repository/publisher_repository.dart';

part 'publisher_repository_impl.g.dart';

class PublisherRepositoryImpl implements PublisherRepository {
  final PublisherDataSource _dataSource;

  PublisherRepositoryImpl(this._dataSource);

  @override
  Future<List<PublisherEntity>> getFollowedPublishers(
      int page, int pageSize) async {
    final publishers = await _dataSource.getFollowedPublishers(page, pageSize);
    return publishers.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<PublisherEntity>> getRecommendedPublishers(
      int page, int pageSize) async {
    final publishers =
        await _dataSource.getRecommendedPublishers(page, pageSize);
    return publishers.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<PublisherEntity>> searchPublishers(
      int page, int pageSize, String query) async {
    final publishers =
        await _dataSource.searchPublishers(page, pageSize, query);
    return publishers.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> toggleFollow(String publisherId, bool isFollowing) async {
    if (isFollowing) {
      _dataSource.unfollowPublisher(publisherId);
    } else {
      _dataSource.followPublisher(publisherId);
    }
  }

  @override
  Future<void> followPublisher(String publisherId) async {
    _dataSource.followPublisher(publisherId);
  }

  @override
  Future<void> unfollowPublisher(String publisherId) async {
    _dataSource.unfollowPublisher(publisherId);
  }
}

@riverpod
PublisherRepository publisherRepository(Ref ref) {
  final dataSource = ref.read(publisherDataSourceProvider);
  return PublisherRepositoryImpl(dataSource);
}
