import 'package:hive_flutter/hive_flutter.dart';
import 'package:topnews/features/news/data/model/news_model.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/data/datasource/news_data_source.dart';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final Box<NewsModel> _box;

  NewsLocalDataSourceImpl(this._box);

  @override
  Future<List<NewsEntity>> getCachedNews() async {
    final models = _box.values.toList();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> cacheNews(List<NewsEntity> news) async {
    await _box.clear();
    final models = news.map((news) => NewsModel.fromEntity(news)).toList();
    await _box.addAll(models);
  }

  @override
  Future<void> clearCache() async {
    await _box.clear();
  }
}
