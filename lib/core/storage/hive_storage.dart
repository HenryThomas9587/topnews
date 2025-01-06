import 'package:hive_flutter/hive_flutter.dart';
import 'package:topnews/features/news/data/model/category_model.dart';
import 'package:topnews/features/news/data/model/news_model.dart';

class HiveStorage {
  static const String newsBox = 'news';
  static const String categoriesBox = 'categories';

  static Future<void> init() async {
    await Hive.initFlutter();

    // 注册适配器
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(NewsModelAdapter());

    // 打开盒子
    await Future.wait([
      Hive.openBox<NewsModel>(newsBox),
      Hive.openBox<CategoryModel>(categoriesBox),
    ]);
  }

  static Future<void> dispose() async {
    await Future.wait([
      Hive.box<NewsModel>(newsBox).close(),
      Hive.box<CategoryModel>(categoriesBox).close(),
    ]);
  }
}
