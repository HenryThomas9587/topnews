import 'package:topnews/features/news/domain/entity/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getNews({
    int page = 1,
    int pageSize = 10,
    int? categoryId,
  });

  Future<void> refreshNews();
}
