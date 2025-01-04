import 'package:topnews/features/news/domain/entity/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getNewsList({int page = 1, int pageSize = 10});
  Future<NewsEntity> getNewsDetail(String id);
}
