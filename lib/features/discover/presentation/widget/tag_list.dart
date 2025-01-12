import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/discover/domain/entity/tag_entity.dart';
import 'package:topnews/features/discover/presentation/widget/tag_list_item.dart';

class TagList extends StatefulWidget {
  const TagList({
    super.key,
    required this.tags,
    required this.onRefresh,
    required this.onLoadMore,
    required this.hasNextPage,
    required this.isLoadingMore,
    required this.onScrollOffsetChanged,
    this.initialScrollOffset = 0.0,
  });

  final List<TagEntity> tags;
  final VoidCallback onRefresh;
  final VoidCallback onLoadMore;
  final bool hasNextPage;
  final bool isLoadingMore;
  final double initialScrollOffset;
  final ValueChanged<double> onScrollOffsetChanged;

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
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
    if (widget.tags.isEmpty) {
      return const Center(child: EmptyView(message: 'No tags found'));
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification &&
            notification.dragDetails != null &&
            notification.metrics.axis == Axis.vertical) {
          return false;
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () async => widget.onRefresh(),
        displacement: 50,
        edgeOffset: 0,
        strokeWidth: 2.5,
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          controller: _scrollController,
          padding: EdgeInsets.zero,
          itemCount: widget.tags.length + (widget.hasNextPage ? 1 : 0),
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            indent: AppTheme.spaceMd,
            endIndent: AppTheme.spaceMd,
          ),
          itemBuilder: (context, index) {
            if (index == widget.tags.length) {
              return const Center(child: LoadingIndicator());
            }
            final tag = widget.tags[index];
            return TagListItem(
              tag: tag,
              isFollowing: tag.isFollowed,
              onFollowTap: () {}, // 由外部处理关注逻辑
            );
          },
        ),
      ),
    );
  }
}
