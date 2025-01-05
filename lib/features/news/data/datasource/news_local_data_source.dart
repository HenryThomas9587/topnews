import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/util/app_directory.dart';
import 'package:topnews/core/util/storage_permission.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/news/data/model/news_model.dart';

part 'news_local_data_source.g.dart';

abstract class NewsLocalDataSource {
  Future<List<NewsModel>> getCachedNewsList();
  Future<void> cacheNewsList(List<NewsModel> news);
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  static const String _newsBoxName = 'news_box';
  static const String _newsListKey = 'news_list';

  @override
  Future<List<NewsModel>> getCachedNewsList() async {
    try {
      // 检查存储权限
      if (!await StoragePermission.check()) {
        throw Exception('没有存储权限');
      }

      final box = await Hive.openBox<String>(_newsBoxName);
      final jsonString = box.get(_newsListKey);
      if (jsonString == null) return [];

      return NewsModel.listFromJson(jsonString);
    } catch (e, stack) {
      logError('获取缓存新闻失败', e, stack);
      return [];
    }
  }

  @override
  Future<void> cacheNewsList(List<NewsModel> news) async {
    try {
      // 检查存储权限
      if (!await StoragePermission.request()) {
        throw Exception('没有存储权限');
      }

      final box = await Hive.openBox<String>(_newsBoxName);
      await box.put(_newsListKey, NewsModel.listToJson(news));

      // 清理过期的缓存文件
      await _cleanupOldCache();
    } catch (e, stack) {
      logError('缓存新闻失败', e, stack);
    }
  }

  Future<void> _cleanupOldCache() async {
    try {
      final cachePath = await AppDirectory.getCachePath();
      final cacheDir = Directory(cachePath);

      if (await cacheDir.exists()) {
        // 删除7天前的缓存
        final now = DateTime.now();
        await for (final entity in cacheDir.list()) {
          if (entity is File) {
            final stat = await entity.stat();
            final age = now.difference(stat.modified);
            if (age.inDays > 7) {
              await entity.delete();
            }
          }
        }
      }
    } catch (e, stack) {
      logError('清理缓存失败', e, stack);
    }
  }
}

@riverpod
NewsLocalDataSource newsLocalDataSource(Ref ref) {
  return NewsLocalDataSourceImpl();
}
