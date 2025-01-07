import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/data/datasource/discover_data_source.dart';
import 'package:topnews/features/discover/data/datasource/discover_remote_data_source_impl.dart';
import 'package:topnews/features/discover/data/model/author_model.dart';
import 'package:topnews/features/discover/data/model/publisher_model.dart';
import 'package:topnews/features/discover/domain/entity/author_entity.dart';
import 'package:topnews/features/discover/domain/entity/publisher_entity.dart';
import 'package:topnews/features/discover/domain/repository/discover_repository.dart';

part 'discover_repository_impl.g.dart';

@riverpod
DiscoverRepository discoverRepository(Ref ref) {
  final dataSource = ref.watch(discoverRemoteDataSourceProvider);
  return DiscoverRepositoryImpl(dataSource);
}

class DiscoverRepositoryImpl implements DiscoverRepository {
  final DiscoverDataSource _dataSource;

  DiscoverRepositoryImpl(this._dataSource);

  @override
  Future<List<PublisherEntity>> getPublishers() async {
    final publishers = await _dataSource.getPublishers();
    return publishers.map((item) => item.toEntity()).toList();
  }

  @override
  Future<List<AuthorEntity>> getAuthors() async {
    final authors = await _dataSource.getAuthors();
    return authors.map((item) => item.toEntity()).toList();
  }

  @override
  Future<void> followPublisher(String publisherId) async {
    await _dataSource.followPublisher(publisherId);
  }

  @override
  Future<void> unfollowPublisher(String publisherId) async {
    await _dataSource.unfollowPublisher(publisherId);
  }

  @override
  Future<void> followAuthor(String authorId) async {
    await _dataSource.followAuthor(authorId);
  }

  @override
  Future<void> unfollowAuthor(String authorId) async {
    await _dataSource.unfollowAuthor(authorId);
  }
}
