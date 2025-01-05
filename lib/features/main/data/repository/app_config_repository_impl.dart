import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/main/data/model/tab_config_model.dart';
import 'package:topnews/features/main/domain/entity/tab_item.dart';
import 'package:topnews/features/main/domain/repository/app_config_repository.dart';

part 'app_config_repository_impl.g.dart';

class AppConfigRepositoryImpl implements AppConfigRepository {
  @override
  Future<List<TabItem>> getTabItems() async {
    // 模拟从本地或远程获取的 JSON 数据
    final List<Map<String, dynamic>> rawData = [
      {
        'id': 'home',
        'label': 'Home',
        'icon': 'home',
        'selectedIcon': 'home_filled',
        'route': '/',
      },
      {
        'id': 'explore',
        'label': 'Discover',
        'icon': 'explore',
        'selectedIcon': 'explore_filled',
        'route': '/explore',
      },
      {
        'id': 'bookmarks',
        'label': 'Bookmarks',
        'icon': 'bookmark',
        'selectedIcon': 'bookmark_filled',
        'route': '/bookmarks',
      },
      {
        'id': 'profile',
        'label': 'Profile',
        'icon': 'person',
        'selectedIcon': 'person_filled',
        'route': '/profile',
      },
    ];

    // 转换数据
    return rawData
        .map((json) => TabConfigModel.fromJson(json).toEntity())
        .toList();
  }
}

@riverpod
AppConfigRepository appConfigRepository(Ref ref) {
  return AppConfigRepositoryImpl();
}
