import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/provider/paged_notifier.dart';
import 'package:topnews/core/provider/paged_state.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/news/data/repository/news_repository_provider.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

// 创建一个缓存管理 provider
final newsPageCacheProvider = Provider((ref) => NewsPageCache());

class NewsPageCache {
  static const maxCacheSize = 3; // 最大缓存数量
  final _cache = <int, KeepAliveLink>{};

  void add(int categoryId, KeepAliveLink link) {
    if (_cache.length >= maxCacheSize) {
      // 移除最早的缓存
      final oldestKey = _cache.keys.first;
      _cache[oldestKey]?.close();
      _cache.remove(oldestKey);
    }
    _cache[categoryId] = link;
  }

  void remove(int categoryId) {
    _cache[categoryId]?.close();
    _cache.remove(categoryId);
  }
}

final newsPageNotifierProvider = AutoDisposeNotifierProviderFamily<
    NewsPageNotifier, PagedState<NewsEntity>, int>(
  NewsPageNotifier.new,
);

class NewsPageNotifier
    extends AutoDisposeFamilyNotifier<PagedState<NewsEntity>, int>
    with PagedFamilyNotifier<NewsEntity, int> {
  @override
  PagedState<NewsEntity> build(int arg) {
    // 获取 keepAlive 链接
    final link = ref.keepAlive();
    // 添加到缓存
    ref.read(newsPageCacheProvider).add(arg, link);

    // 当 provider 被销毁时从缓存中移除
    ref.onDispose(() {
      ref.read(newsPageCacheProvider).remove(arg);
    });

    return super.build(arg);
  }

  @override
  Future<List<NewsEntity>> fetchPage(int page, int pageSize) async {
    final repository = ref.read(newsRepositoryProvider);
    logDebug("NewsPageNotifier$hashCode:"
        ",categoryId: $arg"
        ",page: $page"
        ",pageSize: $pageSize");
    return repository.getNews(
      page: page,
      pageSize: pageSize,
      categoryId: arg,
    );
  }

  void updateScrollOffset(double offset) {
    state = state.copyWith(scrollOffset: offset);
  }
}
