import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/provider/paged_state.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/news/config/news_type.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/presentation/provider/news_page_provider.dart';
import 'package:topnews/features/news/presentation/widget/news_card.dart';
import 'package:throttling/throttling.dart';

class NewsPageList extends HookConsumerWidget {
  const NewsPageList({
    super.key,
    required this.newsType,
    this.query,
  });

  final NewsType newsType;
  final String? query;

  static const _loadMoreOffset = 200; // 距离底部多少像素时触发加载更多
  static const _separatorHeight = AppTheme.spaceSm; // 列表项之间的间距
  static const _throttleLoadMoreTime = 300; // 加载更多的节流时间
  static const _throttleUpdateOffsetTime = 300; // 更新滚动偏移量的节流时间
  static const _throttleLoadMoreDuration =
      Duration(milliseconds: _throttleLoadMoreTime);
  static const _throttleUpdateOffsetDuration =
      Duration(milliseconds: _throttleUpdateOffsetTime);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController(); // 列表的滚动控制器
    final newsParam = useMemoized(
        () => NewsParam(newsType, query ?? ''), [newsType, query]); // 新闻请求参数
    final notifier = ref.read(
        newsPageNotifierProvider(newsParam).notifier); // 获取 NewsPageNotifier
    final state = ref.watch(newsPageNotifierProvider(newsParam)); // 监听新闻列表状态
    final throttleLoadMore = useMemoized(
        () => Throttling<Future<void>>(duration: _throttleLoadMoreDuration),
        []); // 加载更多的节流器
    final throttleUpdateOffset = useMemoized(
        () => Throttling<void>(duration: _throttleUpdateOffsetDuration),
        []); // 更新滚动偏移量的节流器

    // 滚动监听回调，用于加载更多
    final onScroll = useCallback(() {
      if (!scrollController.hasClients) return; // 确保滚动控制器已绑定

      final currentScroll = scrollController.position.pixels; // 当前滚动位置
      final maxScroll = scrollController.position.maxScrollExtent; // 最大滚动范围

      final isLoadingMore = ref.watch(newsPageNotifierProvider(newsParam)
          .select((value) => value.isLoadingMore)); // 是否正在加载更多
      final hasNextPage = ref.watch(newsPageNotifierProvider(newsParam)
          .select((value) => value.hasNextPage)); // 是否有下一页

      throttleUpdateOffset.throttle(
          () => notifier.updateScrollOffset(currentScroll)); // 更新滚动偏移量
      if (currentScroll >= maxScroll - _loadMoreOffset &&
          !isLoadingMore &&
          hasNextPage) {
        throttleLoadMore.throttle(() => notifier.loadNextPage()); // 加载下一页
      }
    }, [
      scrollController,
      notifier,
      throttleLoadMore,
      throttleUpdateOffset,
    ]);

    // 监听滚动事件，添加和移除监听器
    useEffect(() {
      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController, notifier]);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        // 仅在用户垂直拖动滚动时阻止事件冒泡，触发 RefreshIndicator
        if (notification is ScrollUpdateNotification &&
            notification.dragDetails != null &&
            notification.metrics.axis == Axis.vertical) {
          return false; // 继续冒泡以触发 RefreshIndicator
        }
        return true; // 阻止其他滚动通知冒泡
      },
      child: RefreshIndicator(
        onRefresh: () => notifier.refresh(), // 下拉刷新回调
        displacement: 50,
        edgeOffset: 0,
        strokeWidth: 2.5,
        child: state.data.when(
          data: (data) => data.isEmpty
              ? _buildEmptyDataWidget(notifier) // 数据为空时显示提示
              : _buildList(
                  context, scrollController, data, state, notifier), // 构建列表
          error: (error, stackTrace) =>
              _buildErrorWidget(error, notifier), // 加载数据错误时显示错误提示
          loading: () =>
              const Center(child: LoadingIndicator()), // 加载数据时显示加载指示器
        ),
      ),
    );
  }

  // 构建数据为空时的 Widget
  Widget _buildEmptyDataWidget(NewsPageNotifier notifier) {
    return Center(
      child: NoMoreDataWidget(
        onRetry: () => notifier.refresh(), // 点击重试刷新
      ),
    );
  }

  // 构建新闻列表 Widget
  Widget _buildList(
    BuildContext context,
    ScrollController scrollController,
    List<NewsEntity> data,
    PagedState<NewsEntity> state,
    NewsPageNotifier notifier,
  ) {
    return ListView.separated(
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      separatorBuilder: (context, index) =>
          const SizedBox(height: _separatorHeight), // 分隔符
      controller: scrollController, // 滚动控制器
      itemCount: data.length + (state.hasNextPage ? 1 : 0), // 列表项数量，如果有下一页则加 1
      itemBuilder: (context, index) {
        if (index == data.length) {
          return _buildLoadMoreWidget(state, notifier); // 加载更多 Widget
        }
        return NewsCard(news: data[index]); // 新闻卡片 Widget
      },
    );
  }

  // 构建加载更多 Widget
  Widget _buildLoadMoreWidget(
      PagedState<NewsEntity> state, NewsPageNotifier notifier) {
    if (state.isLoadingMore) {
      return const Center(child: LoadingIndicator()); // 加载更多时显示加载指示器
    }
    if (state.isLoadMoreError) {
      return Center(
        child: ErrorView(
          error: '加载更多失败',
          isLoadMoreError: true,
          onRetry: () => notifier.loadNextPage(), // 加载更多失败时显示错误提示
        ),
      );
    }
    return const SizedBox.shrink(); // 没有更多数据时返回空 Widget
  }

  // 构建错误提示 Widget
  Widget _buildErrorWidget(Object errorData, NewsPageNotifier notifier) {
    return Center(
      child: ErrorView(
        error: errorData,
        onRetry: () => notifier.refresh(),
      ),
    );
  }
}
