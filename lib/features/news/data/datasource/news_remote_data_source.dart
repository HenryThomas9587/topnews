import 'package:topnews/features/news/data/model/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNewsList({int page = 1, int pageSize = 10});
  Future<NewsModel> getNewsDetail(String id);
}
