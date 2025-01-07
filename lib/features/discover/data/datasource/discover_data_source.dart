import 'package:topnews/features/discover/data/model/author_model.dart';
import 'package:topnews/features/discover/data/model/publisher_model.dart';

abstract class DiscoverDataSource {
  Future<List<PublisherModel>> getPublishers();
  Future<List<AuthorModel>> getAuthors();

  Future<void> followPublisher(String publisherId);
  Future<void> unfollowPublisher(String publisherId);
  Future<void> followAuthor(String authorId);
  Future<void> unfollowAuthor(String authorId);
}
