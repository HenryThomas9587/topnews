import 'package:topnews/features/discover/data/model/author_model.dart';
import 'package:topnews/features/discover/data/model/tag_model.dart';
import 'package:topnews/features/news/data/model/news_model.dart';

abstract class SearchResultsDataSource {
  Future<List<NewsModel>> searchNews(String query);
  Future<List<AuthorModel>> searchAuthors(String query);
  Future<List<TagModel>> searchTags(String query);
}
