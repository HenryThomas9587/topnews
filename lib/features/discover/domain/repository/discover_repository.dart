import 'package:topnews/features/discover/domain/entity/author_entity.dart';
import 'package:topnews/features/discover/domain/entity/publisher_entity.dart';

abstract class DiscoverRepository {
  Future<List<PublisherEntity>> getPublishers();
  Future<List<AuthorEntity>> getAuthors();

  Future<void> followPublisher(String publisherId);
  Future<void> unfollowPublisher(String publisherId);
  Future<void> followAuthor(String authorId);
  Future<void> unfollowAuthor(String authorId);
}
