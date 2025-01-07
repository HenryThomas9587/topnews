import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/data/datasource/discover_data_source.dart';
import 'package:topnews/features/discover/data/datasource/mock/mock_discover_data.dart';
import 'package:topnews/features/discover/data/model/author_model.dart';
import 'package:topnews/features/discover/data/model/publisher_model.dart';

part 'discover_remote_data_source_impl.g.dart';

class DiscoverRemoteDataSourceImpl implements DiscoverDataSource {
  // 存储关注状态
  final _followedPublishers = <String>{};
  final _followedAuthors = <String>{};

  @override
  Future<List<PublisherModel>> getPublishers() async {
    await Future.delayed(const Duration(milliseconds: 800));
    final publishers = MockDiscoverData.getPublishers();
    // 更新关注状态
    return publishers
        .map((publisher) => publisher.copyWith(
            isFollowing: _followedPublishers.contains(publisher.id)))
        .toList();
  }

  @override
  Future<List<AuthorModel>> getAuthors() async {
    await Future.delayed(const Duration(milliseconds: 800));
    final authors = MockDiscoverData.getAuthors();
    // 更新关注状态
    return authors
        .map((author) =>
            author.copyWith(isFollowing: _followedAuthors.contains(author.id)))
        .toList();
  }

  @override
  Future<void> followPublisher(String publisherId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _followedPublishers.add(publisherId);
  }

  @override
  Future<void> unfollowPublisher(String publisherId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _followedPublishers.remove(publisherId);
  }

  @override
  Future<void> followAuthor(String authorId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _followedAuthors.add(authorId);
  }

  @override
  Future<void> unfollowAuthor(String authorId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _followedAuthors.remove(authorId);
  }
}

@riverpod
DiscoverDataSource discoverRemoteDataSource(Ref ref) {
  return DiscoverRemoteDataSourceImpl();
}
