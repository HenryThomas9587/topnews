import 'package:flutter/material.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/presentation/widget/news_card.dart';

class NewsList extends StatefulWidget {
  const NewsList({
    super.key,
    required this.news,
    required this.onRefresh,
    required this.onLoadMore,
    required this.hasNextPage,
    required this.isLoadingMore,
    required this.onScrollOffsetChanged,
    this.initialScrollOffset = 0.0,
  });

  final List<NewsEntity> news;
  final VoidCallback onRefresh;
  final VoidCallback onLoadMore;
  final bool hasNextPage;
  final bool isLoadingMore;
  final double initialScrollOffset;
  final ValueChanged<double> onScrollOffsetChanged;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: widget.initialScrollOffset,
    );
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final currentScroll = _scrollController.position.pixels;
    widget.onScrollOffsetChanged(currentScroll);

    final maxScroll = _scrollController.position.maxScrollExtent;
    if (currentScroll >= maxScroll - 200 &&
        !widget.isLoadingMore &&
        widget.hasNextPage) {
      widget.onLoadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        // 只有垂直滚动时才触发刷新
        if (notification is ScrollUpdateNotification &&
            notification.dragDetails != null && // 确保是用户拖动
            notification.metrics.axis == Axis.vertical) {
          return false; // 继续冒泡以触发 RefreshIndicator
        }
        return true; // 阻止其他滚动通知冒泡
      },
      child: RefreshIndicator(
        onRefresh: () async => widget.onRefresh(),
        displacement: 50,
        edgeOffset: 0,
        strokeWidth: 2.5,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          controller: _scrollController,
          itemCount: widget.news.length + (widget.hasNextPage ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == widget.news.length) {
              return const Center(child: LoadingIndicator());
            }
            return NewsCard(news: widget.news[index]);
          },
        ),
      ),
    );
  }
}
