import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:topnews/features/home/data/model/story_model.dart';
import 'package:topnews/features/home/domain/entity/story_entity.dart';
import 'package:topnews/features/home/data/datasource/story_data_source.dart';

class StoryLocalDataSourceImpl implements StoryLocalDataSource {
  static const _boxName = 'stories';
  static const _cacheKey = 'cached_stories';
  final Box<String> _box;

  StoryLocalDataSourceImpl(this._box);

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(_boxName);
  }

  static Future<StoryLocalDataSourceImpl> create() async {
    final box = await Hive.openBox<String>(_boxName);
    return StoryLocalDataSourceImpl(box);
  }

  @override
  Future<List<StoryEntity>> getCachedStories() async {
    final jsonString = _box.get(_cacheKey);
    if (jsonString == null) return [];

    try {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) => StoryModel.fromJson(json))
          .map((model) => model.toEntity())
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> cacheStories(List<StoryEntity> stories) async {
    final jsonString = json.encode(
      stories
          .map((story) => StoryModel.fromEntity(story))
          .map((model) => model.toJson())
          .toList(),
    );
    await _box.put(_cacheKey, jsonString);
  }

  @override
  Future<void> clearCache() async {
    await _box.delete(_cacheKey);
  }

  Future<void> dispose() async {
    await _box.close();
  }
}
