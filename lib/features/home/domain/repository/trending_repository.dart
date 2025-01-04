import 'package:topnews/features/home/domain/entity/trending_news_entity.dart';

abstract class TrendingRepository {
  Future<List<TrendingNewsEntity>> getTrendingNews();
}
