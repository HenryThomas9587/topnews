import 'package:riverpod_annotation/riverpod_annotation.dart';

class PagedState<T> {
  final AsyncValue<List<T>> data;
  final int currentPage;
  final bool hasNextPage;
  final bool isLoadingMore;
  final bool isRefreshing;
  final double scrollOffset;

  static const defaultPageSize = 10;

  const PagedState._({
    required this.data,
    required this.currentPage,
    required this.hasNextPage,
    required this.isLoadingMore,
    required this.isRefreshing,
    this.scrollOffset = 0.0,
  });

  factory PagedState() {
    return PagedState<T>._(
      data: AsyncValue<List<T>>.loading(),
      currentPage: 1,
      hasNextPage: false,
      isLoadingMore: false,
      isRefreshing: false,
      scrollOffset: 0.0,
    );
  }

  PagedState<T> copyWith({
    AsyncValue<List<T>>? data,
    int? currentPage,
    bool? hasNextPage,
    bool? isLoadingMore,
    bool? isRefreshing,
    double? scrollOffset,
  }) {
    return PagedState<T>._(
      data: data ?? this.data,
      currentPage: currentPage ?? this.currentPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      scrollOffset: scrollOffset ?? this.scrollOffset,
    );
  }
}
