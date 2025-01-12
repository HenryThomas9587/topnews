import 'package:hive_flutter/hive_flutter.dart';
import 'package:topnews/features/news/data/model/news_model.dart';
import 'package:topnews/features/news/data/datasource/news_data_source.dart';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final Box<List<NewsModel>> _box;

  NewsLocalDataSourceImpl(this._box);

  @override
  Future<List<NewsModel>> getCachedNews(String key) async {
    final models = _box.get(key);
    return models ?? [];
  }

  @override
  Future<void> cacheNews(String key, List<NewsModel> news) async {
    _box.put(key, news);
  }

  @override
  Future<void> clearCache(String key) async {
    _box.delete(key);
  }
}
