import 'package:hive_flutter/hive_flutter.dart';
import 'package:topnews/features/news/data/model/category_model.dart';
import 'package:topnews/features/news/data/model/news_draft_model.dart';
import 'package:topnews/features/news/data/model/news_model.dart';

class HiveStorage {
  static const String newsCacheBox = 'news_cache';
  static const String categoriesCacheBox = 'categories_cache';

  static const String newsDraftBox = 'news_draft';

  static Future<void> init() async {
    await Hive.initFlutter();

    // 注册适配器
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(NewsModelAdapter());
    Hive.registerAdapter(NewsDraftModelAdapter());

    // 打开盒子
    await Future.wait([
      Hive.openBox<List<NewsModel>>(newsCacheBox),
      Hive.openBox<List<CategoryModel>>(categoriesCacheBox),
      Hive.openBox<NewsDraftModel>(newsDraftBox),
    ]);
  }

  static Future<void> dispose() async {
    await Future.wait([
      Hive.box<List<NewsModel>>(newsCacheBox).close(),
      Hive.box<List<CategoryModel>>(categoriesCacheBox).close(),
      Hive.box<NewsDraftModel>(newsDraftBox).close(),
    ]);
  }
}
