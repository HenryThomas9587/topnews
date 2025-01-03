import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/data/repository/news_repository_impl.dart';

part 'news_provider.g.dart';

@Riverpod(keepAlive: true)
class NewsNotifier extends _$NewsNotifier {
  bool _isInitialized = false;

  @override
  Future<List<NewsEntity>> build() async {
    if (!_isInitialized) {
      _isInitialized = true;
      return _fetchNews();
    }
    return state.valueOrNull ?? [];
  }

  Future<List<NewsEntity>> _fetchNews() async {
    final repository = ref.read(newsRepositoryProvider);
    return repository.getNewsList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_fetchNews);
  }
}
