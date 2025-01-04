import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/data/repository/news_repository_impl.dart';

part 'news_provider.g.dart';

@Riverpod(keepAlive: true)
class NewsNotifier extends _$NewsNotifier {
  static const _pageSize = 10;
  int _page = 1;
  bool _hasMore = true;

  @override
  Future<List<NewsEntity>> build() async {
    return _fetchNews();
  }

  Future<List<NewsEntity>> _fetchNews() async {
    final repository = ref.read(newsRepositoryProvider);
    final news = await repository.getNewsList(page: _page, pageSize: _pageSize);
    _hasMore = news.length >= _pageSize;
    return news;
  }

  Future<void> loadMore() async {
    if (!_hasMore) return;
    _page++;
    final more = await _fetchNews();
    state = AsyncValue.data([...state.value ?? [], ...more]);
  }

  Future<void> refresh() async {
    _page = 1;
    _hasMore = true;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_fetchNews);
  }
}
