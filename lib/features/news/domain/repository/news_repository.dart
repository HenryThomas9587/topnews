import 'package:topnews/features/news/domain/entity/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getNewsList();
  Future<NewsEntity> getNewsDetail(String id);
}
