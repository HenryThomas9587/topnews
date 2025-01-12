import 'package:topnews/features/discover/domain/entity/author_entity.dart';

abstract class AuthorRepository {
  Future<List<AuthorEntity>> getFollowedAuthors(int page, int pageSize);
  Future<List<AuthorEntity>> getRecommendedAuthors(
      int page, int pageSize, String userType);
  Future<List<AuthorEntity>> getLatestAuthors(int page, int pageSize);
  Future<List<AuthorEntity>> getCategoryAuthors(
      int page, int pageSize, String query);
  Future<List<AuthorEntity>> searchAuthors(
      int page, int pageSize, String query);
  Future<void> toggleFollow(String authorId, bool isFollowing);
  Future<void> followAuthor(String authorId);
  Future<void> unFollowAuthor(String authorId);
}
