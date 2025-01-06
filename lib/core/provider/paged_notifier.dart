import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/provider/paged_state.dart';

mixin PagedNotifier<T> on AutoDisposeNotifier<PagedState<T>> {
  Future<List<T>> fetchPage(int page, int pageSize);

  @override
  PagedState<T> build() {
    onInit();
    return PagedState<T>();
  }

  void onInit() {
    loadFirstPage();
  }

  Future<void> loadFirstPage() async {
    state = state.copyWith(data: const AsyncValue.loading());

    try {
      final items = await fetchPage(1, PagedState.defaultPageSize);
      state = state.copyWith(
        data: AsyncValue.data(items),
        currentPage: 1,
        hasNextPage: items.length >= PagedState.defaultPageSize,
      );
    } catch (error, stackTrace) {
      state = state.copyWith(data: AsyncValue.error(error, stackTrace));
    }
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
      );
    } catch (error) {
      state = state.copyWith(isLoadingMore: false);
    }
  }

  Future<void> refresh() async {
    state = state.copyWith(
      data: const AsyncValue.loading(),
      currentPage: 1,
      hasNextPage: true,
      isLoadingMore: false,
    );

    try {
      final items = await fetchPage(1, PagedState.defaultPageSize);
      state = state.copyWith(
        data: AsyncValue.data(items),
        hasNextPage: items.length >= PagedState.defaultPageSize,
      );
    } catch (error, stackTrace) {
      state = state.copyWith(data: AsyncValue.error(error, stackTrace));
    }
  }
}

mixin PagedFamilyNotifier<T, Arg>
    on AutoDisposeFamilyNotifier<PagedState<T>, Arg> {
  Future<List<T>> fetchPage(int page, int pageSize);

  @override
  PagedState<T> build(Arg arg) {
    Future.microtask(() {
      onInit();
    });
    return PagedState<T>();
  }

  void onInit() {
    loadFirstPage();
  }

  Future<void> loadFirstPage() async {
    state = state.copyWith(data: const AsyncValue.loading());

    try {
      final items = await fetchPage(1, PagedState.defaultPageSize);
      state = state.copyWith(
        data: AsyncValue.data(items),
        currentPage: 1,
        hasNextPage: items.length >= PagedState.defaultPageSize,
      );
    } catch (error, stackTrace) {
      state = state.copyWith(data: AsyncValue.error(error, stackTrace));
    }
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
      );
    } catch (error) {
      state = state.copyWith(isLoadingMore: false);
    }
  }

  Future<void> refresh() async {
    state = state.copyWith(
      data: const AsyncValue.loading(),
      currentPage: 1,
      hasNextPage: true,
      isLoadingMore: false,
    );

    try {
      final items = await fetchPage(1, PagedState.defaultPageSize);
      state = state.copyWith(
        data: AsyncValue.data(items),
        hasNextPage: items.length >= PagedState.defaultPageSize,
      );
    } catch (error, stackTrace) {
      state = state.copyWith(data: AsyncValue.error(error, stackTrace));
    }
  }
}
