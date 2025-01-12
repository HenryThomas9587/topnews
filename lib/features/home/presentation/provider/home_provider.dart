import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/home/domain/entity/home_section.dart';
import 'package:topnews/features/home/domain/usecase/get_home_sections_usecase.dart';
import 'package:topnews/features/home/presentation/provider/home_state.dart';

part 'home_provider.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  static const _pageSize = 10;

  @override
  FutureOr<HomeState> build() async {
    logDebug("HomeNotifier:${hashCode.toString()} - Initial build");
    return _init();
  }

  Future<HomeState> _init() async {
    int initPage = 1;
    final sections = await ref.read(getHomeSectionsProvider).execute(
          page: initPage,
          pageSize: _pageSize,
        );
    return HomeState(
        sections: sections,
        currentPage: initPage + 1,
        hasMore: sections.length >= _pageSize);
  }

  Future<List<HomeSection>> _fetchSections() async {
    final currentState = await future;
    logDebug('HomeNotifier _fetchSections: page=${currentState.currentPage}');
    return ref.read(getHomeSectionsProvider).execute(
          page: currentState.currentPage,
          pageSize: _pageSize,
        );
  }

  Future<void> loadMoreData() async {
    final currentState = await future;
    if (currentState.isRefreshing ||
        currentState.isLoadingMore ||
        !currentState.hasMore) {
      return;
    }

    logDebug(
        'HomeNotifier loadMoreData: loading page ${currentState.currentPage}');
    state =
        AsyncValue.data(currentState.copyWith(isLoadingMore: true)); // 设置加载更多状态

    try {
      final nextSections = await _fetchSections();
      final hasMore = nextSections.length >= _pageSize;
      final currentPage = hasMore ? currentState.currentPage + 1 : 1;
      state = AsyncValue.data(currentState.copyWith(
        sections: [...currentState.sections, ...nextSections],
        currentPage: currentPage,
        hasMore: hasMore,
        isLoadingMore: false,
      ));
    } catch (e, stack) {
      logError('HomeNotifier loadMoreData failed', e, stack);
      state = AsyncValue<HomeState>.error(e, stack).copyWithPrevious(
          AsyncValue.data(
              currentState.copyWith(isLoadingMore: false))); // 发生错误时也需要重置加载更多状态
    }
  }

  Future<void> refresh() async {
    final currentState = await future;
    if (currentState.isRefreshing || currentState.isLoadingMore) {
      logDebug(
          'HomeNotifier refresh: skip refresh - isRefreshing: ${currentState.isRefreshing}, isLoadingMore: ${currentState.isLoadingMore}');
      return;
    }

    logDebug('HomeNotifier refresh: starting refresh');
    state =
        AsyncValue.data(currentState.copyWith(isRefreshing: true)); // 设置刷新状态
    try {
      // Reset to page 1 for refresh
      state = AsyncValue.data(currentState.copyWith(currentPage: 1));
      final sections = await _fetchSections();
      final hasMore = sections.length >= _pageSize;
      final currentPage = hasMore ? currentState.currentPage + 1 : 1;
      state = AsyncValue.data(HomeState(
        sections: sections,
        currentPage: currentPage,
        hasMore: hasMore,
      ));
      logDebug('HomeNotifier refresh: refreshed successfully');
    } catch (e, stack) {
      logError('HomeNotifier refresh failed', e, stack);
      state = AsyncValue<HomeState>.error(e, stack).copyWithPrevious(
          AsyncValue.data(
              currentState.copyWith(isRefreshing: false))); // 发生错误时也需要重置刷新状态
    }
  }
}
