import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/error/app_error.dart';
import 'package:topnews/features/discover/data/datasource/mock/mock_author_data.dart';
import 'package:topnews/features/discover/data/model/author_model.dart';

part 'author_data_source.g.dart';

abstract class AuthorDataSource {
  Future<List<AuthorModel>> getFollowedAuthors(int page, int pageSize);
  Future<List<AuthorModel>> getRecommendedAuthors(
      int page, int pageSize, String userType);
  Future<List<AuthorModel>> searchAuthors(int page, int pageSize, String query);
  Future<List<AuthorModel>> getLatestAuthors(int page, int pageSize);
  Future<List<AuthorModel>> getCategoryAuthors(
      int page, int pageSize, String query);
  Future<void> followAuthor(String authorId);
  Future<void> unFollowAuthor(String authorId);
}

class AuthorRemoteDataSource implements AuthorDataSource {
  final MockAuthorDataSource _mockAuthorDataSource = MockAuthorDataSource();

  @override
  Future<List<AuthorModel>> getFollowedAuthors(int page, int pageSize) {
    return Future.value(
        _mockAuthorDataSource.getFollowedAuthorList(page, pageSize));
  }

  @override
  Future<List<AuthorModel>> getRecommendedAuthors(
      int page, int pageSize, String userType) {
    return Future.value(
        _mockAuthorDataSource.getRecommendedAuthorList(page, pageSize, userType));
  }

  @override
  Future<List<AuthorModel>> getLatestAuthors(int page, int pageSize) {
    return Future.value(
        _mockAuthorDataSource.getLatestAuthorList(page, pageSize));
  }

  @override
  Future<List<AuthorModel>> getCategoryAuthors(
      int page, int pageSize, String query) {
    return Future.value(_mockAuthorDataSource.getCategoryAuthorList(query));
  }

  @override
  Future<List<AuthorModel>> searchAuthors(
      int page, int pageSize, String query) {
    return Future.value(_mockAuthorDataSource.getSearchAuthorList(query));
  }

  @override
  Future<void> followAuthor(String authorId) async {
    final result =
        await _mockAuthorDataSource.getFollowedAuthorResult(authorId, false);
    if (result.code != 200) {
      return Future.error(AppError.custom(result.message));
    }
    return Future.value();
  }

  @override
  Future<void> unFollowAuthor(String authorId) async {
    final result =
        await _mockAuthorDataSource.getFollowedAuthorResult(authorId, true);
    if (result.code != 200) {
      return Future.error(AppError.custom(result.message));
    }
    return Future.value();
  }
}

@riverpod
AuthorDataSource authorDataSource(Ref ref) {
  return AuthorRemoteDataSource();
}
