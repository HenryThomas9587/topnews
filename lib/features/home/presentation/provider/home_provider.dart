import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/home/domain/usecase/get_home_sections_usecase.dart';
import 'package:topnews/features/home/domain/entity/home_section.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
class HomeNotifier extends _$HomeNotifier {
  static const _pageSize = 10;
  static const _maxPages = 3;

  bool _isLoadingMore = false;
  bool _isRefreshing = false;
  int _currentPage = 1;

  bool get isLoadingMore => _isLoadingMore;
  bool get isRefreshing => _isRefreshing;

  @override
  FutureOr<List<HomeSection>> build() async {
    logDebug("HomeNotifier:${hashCode.toString()}");
    _currentPage = 1;
    return _fetchSections(_currentPage);
  }

  Future<List<HomeSection>> _fetchSections(int page) async {
    logDebug('HomeNotifier _fetchSections: page=$page');
    return ref.read(getHomeSectionsProvider).execute(
          page: page,
          pageSize: _pageSize,
        );
  }

  Future<void> loadMoreData() async {
    if (_isLoadingMore || _isRefreshing || state.isLoading || state.hasError) {
      logDebug('HomeNotifier loadMoreData: skip loading');
      return;
    }

    final currentSections = state.value ?? [];
    final hasMoreStories = currentSections
        .any((s) => s.type == HomeSectionType.story && s.item != null);

    if (_currentPage >= _maxPages || !hasMoreStories) {
      logDebug(
          'HomeNotifier loadMoreData: reached max pages or no more stories');
      return;
    }

    logDebug('HomeNotifier loadMoreData: loading page ${_currentPage + 1}');
    _isLoadingMore = true;
    try {
      final nextPage = _currentPage + 1;
      final nextSections = await _fetchSections(nextPage);
      currentSections.addAll(nextSections);
      _currentPage = nextPage;
      state = AsyncValue.data(currentSections);
    } catch (e, stack) {
      logError('HomeNotifier loadMoreData failed', e, stack);
      state = AsyncValue.error(e, stack);
    } finally {
      _isLoadingMore = false;
    }
  }

  Future<void> refresh() async {
    if (_isRefreshing) {
      logDebug('HomeNotifier refresh: already refreshing');
      return;
    }

    logDebug('HomeNotifier refresh: starting refresh');
    _isRefreshing = true;
    _isLoadingMore = false;
    _currentPage = 1;

    try {
      final sections = await _fetchSections(1);
      state = AsyncValue.data(sections);
    } catch (e, stack) {
      logError('HomeNotifier refresh failed', e, stack);
      state = AsyncValue.error(e, stack);
    } finally {
      _isRefreshing = false;
    }
  }
}
