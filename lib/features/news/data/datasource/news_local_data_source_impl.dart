import 'package:hive_flutter/hive_flutter.dart';
import 'package:topnews/features/news/data/model/news_model.dart';
import 'package:topnews/features/news/data/datasource/news_data_source.dart';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final Box<NewsModel> _box;

  NewsLocalDataSourceImpl(this._box);

  @override
  Future<List<NewsModel>> getCachedNews() async {
    final models = _box.values.toList();
    return models;
  }

  @override
  Future<void> cacheNews(List<NewsModel> news) async {
    await _box.clear();
    await _box.addAll(news);
  }

  @override
  Future<void> clearCache() async {
    await _box.clear();
  }
}
