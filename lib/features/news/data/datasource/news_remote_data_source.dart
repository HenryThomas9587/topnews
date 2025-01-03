import 'package:topnews/features/news/data/model/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNewsList();
  Future<NewsModel> getNewsDetail(String id);
}
