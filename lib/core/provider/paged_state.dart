import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'paged_state.freezed.dart';

@freezed
class PagedState<T> with _$PagedState<T> {
  factory PagedState({
    required AsyncValue<List<T>> data,
    @Default(1) int currentPage,
    @Default(false) bool hasNextPage,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    @Default(false) bool isLoadMoreError,
    @Default(0.0) double scrollOffset,
  }) = _PagedState<T>;

  static const defaultPageSize = 10;

  factory PagedState.initial() {
    return PagedState(
      data: const AsyncData([]), // 将初始 data 设置为 [], 表示空状态
      currentPage: 1,
      hasNextPage: false,
      isLoadingMore: false,
      isRefreshing: false,
      isLoadMoreError: false,
      scrollOffset: 0.0,
    );
  }
}
