import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/data/repository/news_repository_impl.dart';

part 'news_detail_provider.g.dart';

@riverpod
class NewsDetailNotifier extends _$NewsDetailNotifier {
  static const _cacheTime = Duration(minutes: 5);
  DateTime? _lastFetchTime;
  NewsEntity? _cachedNews;

  @override
  Future<NewsEntity> build(String newsId) async {
    if (_shouldRefetch) {
      final repository = ref.read(newsRepositoryProvider);
      _cachedNews = await repository.getNewsDetail(newsId);
      _lastFetchTime = DateTime.now();
    }
    return _cachedNews!;
  }

  bool get _shouldRefetch {
    if (_cachedNews == null || _lastFetchTime == null) return true;
    return DateTime.now().difference(_lastFetchTime!) > _cacheTime;
  }

  Future<void> refresh() async {
    _lastFetchTime = null;
    ref.invalidateSelf();
  }
}
