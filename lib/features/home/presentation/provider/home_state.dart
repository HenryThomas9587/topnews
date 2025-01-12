import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topnews/features/home/domain/entity/home_section.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<HomeSection> sections,
    @Default(1) int currentPage,
    @Default(false) bool isRefreshing, // 表示是否正在下拉刷新
    @Default(true) bool hasMore, // 表示是否还有更多数据可以加载
    @Default(false) bool isLoadingMore, // 新增：加载更多状态
  }) = _HomeState;
}
