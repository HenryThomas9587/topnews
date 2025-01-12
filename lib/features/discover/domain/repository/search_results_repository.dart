import 'package:topnews/features/discover/domain/entity/author_entity.dart';
import 'package:topnews/features/discover/domain/entity/tag_entity.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

abstract class SearchResultsRepository {
  Future<List<NewsEntity>> searchNews(String query);
  Future<List<AuthorEntity>> searchAuthors(String query);
  Future<List<TagEntity>> searchTags(String query);
}
