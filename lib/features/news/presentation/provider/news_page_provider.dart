import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/provider/paged_notifier.dart';
import 'package:topnews/core/provider/paged_state.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/news/config/news_type.dart';
import 'package:topnews/features/news/data/repository/news_repository_provider.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

// // 创建一个缓存管理 provider
// final newsPageCacheProvider = Provider((ref) => NewsPageCache());

// class NewsPageCache {
//   static const maxCacheSize = 3; // 最大缓存数量
//   final _cache = <String, KeepAliveLink>{};

//   void add(String categoryId, KeepAliveLink link) {
//     if (_cache.length >= maxCacheSize) {
//       // 移除最早的缓存
//       final oldestKey = _cache.keys.first;
//       _cache[oldestKey]?.close();
//       _cache.remove(oldestKey);
//     }
//     _cache[categoryId] = link;
//   }

//   void remove(String categoryId) {
//     _cache[categoryId]?.close();
//     _cache.remove(categoryId);
//   }
// }

class NewsParam {
  final NewsType type;
  final String query;

  NewsParam(this.type, this.query);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsParam &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          query == other.query;

  @override
  int get hashCode => type.hashCode ^ query.hashCode;
}

final newsPageNotifierProvider = AutoDisposeNotifierProviderFamily<
    NewsPageNotifier, PagedState<NewsEntity>, NewsParam>(
  NewsPageNotifier.new,
);

class NewsPageNotifier
    extends AutoDisposeFamilyNotifier<PagedState<NewsEntity>, NewsParam>
    with PagedFamilyNotifier<NewsEntity, NewsParam> {
  @override
  Future<List<NewsEntity>> fetchPage(int page, int pageSize) async {
    return _switchType(page, pageSize, arg.type);
  }

  // switch type
  Future<List<NewsEntity>> _switchType(
      int page, int pageSize, NewsType type) async {
    final repository = ref.read(newsRepositoryProvider);
    final NewsType newsType = arg.type;
    logDebug("NewsPageNotifier-$hashCode:"
        ",type: $newsType"
        ",page: $page"
        ",pageSize: $pageSize"
        ",query: ${arg.query}");
    // 根据 type 切换查询条件
    switch (newsType) {
      case NewsType.top:
        return repository.getTopNews();
      case NewsType.latest:
        return repository.getLatestNews(page, pageSize);
      case NewsType.recommended:
        return repository.getRecommendedNews(page, pageSize);
      case NewsType.search:
        return repository.searchNews(page, pageSize, arg.query);
      case NewsType.trending:
        return repository.getTrendingNews(page, pageSize);
      case NewsType.category:
        return repository.getCategoryNews(page, pageSize, arg.query);
    }
  }

  @override
  void updateScrollOffset(double offset) {
    state = state.copyWith(scrollOffset: offset);
  }
}
