import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/data/datasource/author_data_source.dart';
import 'package:topnews/features/discover/data/model/author_model.dart';
import 'package:topnews/features/discover/domain/entity/author_entity.dart';
import 'package:topnews/features/discover/domain/repository/author_repository.dart';

part 'author_repository_impl.g.dart';

class AuthorRepositoryImpl implements AuthorRepository {
  final AuthorDataSource _dataSource;

  AuthorRepositoryImpl(this._dataSource);

  @override
  Future<List<AuthorEntity>> getFollowedAuthors(int page, int pageSize) async {
    final authors = await _dataSource.getFollowedAuthors(page, pageSize);
    return authors.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<AuthorEntity>> getRecommendedAuthors(
      int page, int pageSize, String userType) async {
    final authors = await _dataSource.getRecommendedAuthors(page, pageSize, userType);
    return authors.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<AuthorEntity>> getLatestAuthors(int page, int pageSize) async {
    final authors = await _dataSource.getLatestAuthors(page, pageSize);
    return authors.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<AuthorEntity>> getCategoryAuthors(
      int page, int pageSize, String query) async {
    final authors = await _dataSource.getCategoryAuthors(page, pageSize, query);
    return authors.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<AuthorEntity>> searchAuthors(
      int page, int pageSize, String query) async {
    final authors = await _dataSource.searchAuthors(page, pageSize, query);
    return authors.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> toggleFollow(String authorId, bool isFollowing) async {
    if (isFollowing) {
      unFollowAuthor(authorId);
    } else {
      followAuthor(authorId);
    }
  }

  @override
  Future<void> followAuthor(String authorId) async {
    _dataSource.followAuthor(authorId);
  }

  @override
  Future<void> unFollowAuthor(String authorId) async {
    _dataSource.unFollowAuthor(authorId);
  }
}

@riverpod
AuthorRepository authorRepository(Ref ref) {
  final dataSource = ref.read(authorDataSourceProvider);
  return AuthorRepositoryImpl(dataSource);
}
