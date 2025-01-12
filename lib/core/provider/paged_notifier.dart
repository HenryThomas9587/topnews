import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/provider/paged_state.dart';

mixin PagedFamilyNotifier<T, Arg>
    on AutoDisposeFamilyNotifier<PagedState<T>, Arg> {
  Future<List<T>> fetchPage(int page, int pageSize);

  @override
  PagedState<T> build(Arg arg) {
    Future.microtask(() {
      onInit();
    });
    return PagedState.initial();
  }

  void onInit() {
    loadFirstPage();
  }

  Future<void> _fetchData(int page, int pageSize,
      {bool isRefresh = false}) async {
    try {
      final items = await fetchPage(page, pageSize);
      if (isRefresh) {
        state = state.copyWith(
          data: AsyncValue.data(items),
          currentPage: page,
          hasNextPage: items.length >= pageSize,
          isRefreshing: false, // Reset isRefreshing after data is loaded
        );
      } else {
        state = state.copyWith(
          data: AsyncValue.data(items),
          currentPage: page,
          hasNextPage: items.length >= pageSize,
        );
      }
    } catch (error, stackTrace) {
      state = state.copyWith(
        data: AsyncValue.error(error, stackTrace),
        isRefreshing: false,
        isLoadingMore: false, // Ensure isLoadingMore is reset on error
      );
    }
  }

  Future<void> loadFirstPage() async {
    state = state.copyWith(data: const AsyncValue.loading());
    await _fetchData(1, PagedState.defaultPageSize);
  }

  Future<void> refresh() async {
    if (state.isRefreshing) return; // Avoid multiple refresh calls

    state = state.copyWith(
        data: const AsyncValue.loading(),
        currentPage: 1,
        hasNextPage: true,
        isLoadingMore: false,
        isLoadMoreError: false,
        isRefreshing: true);
    await _fetchData(1, PagedState.defaultPageSize, isRefresh: true);
  }

  Future<void> loadNextPage() async {
    if (state.isLoadingMore || !state.hasNextPage) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final nextPage = state.currentPage + 1;
      final items = await fetchPage(nextPage, PagedState.defaultPageSize);

      final currentItems = state.data.value ?? [];
      final newItems = [...currentItems, ...items];

      state = state.copyWith(
        data: AsyncValue.data(newItems),
        currentPage: nextPage,
        hasNextPage: items.length >= PagedState.defaultPageSize,
        isLoadingMore: false,
        isLoadMoreError: false,
      );
    } catch (error, _) {
      state = state.copyWith(
        isLoadingMore: false,
        isLoadMoreError: true,
      );
    }
  }

  void clear() {
    state = PagedState.initial();
  }

  void updateScrollOffset(double offset) {
    state = state.copyWith(scrollOffset: offset);
  }
}
