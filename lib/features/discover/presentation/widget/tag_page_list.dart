import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/discover/config/tag_type.dart';
import 'package:topnews/features/discover/presentation/provider/tag_page_provider.dart';
import 'package:topnews/features/discover/presentation/widget/tag_list_item.dart';

class TagPageList extends HookConsumerWidget {
  const TagPageList({
    super.key,
    required this.tagType,
    this.query,
  });

  final TagType tagType;
  final String? query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final tagParam = TagParam(tagType, query ?? '');
    final notifier = ref.read(tagPageNotifierProvider(tagParam).notifier);
    final state = ref.watch(tagPageNotifierProvider(tagParam));

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;
        // 更新滚动位置
        final currentScroll = scrollController.position.pixels;
        notifier.updateScrollOffset(currentScroll);
        // 计算最大滚动位置
        final maxScroll = scrollController.position.maxScrollExtent;
        if (currentScroll >= maxScroll - 200 &&
            !state.isLoadingMore &&
            state.hasNextPage) {
          // 加载下一页
          notifier.loadNextPage();
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController, query]);

    final news = state.data.value ?? [];

    if (state.data.isLoading && state.currentPage == 1) {
      return const Center(child: LoadingIndicator());
    } else if (state.data.hasError) {
      return const Center(child: ErrorView());
    } else if (news.isEmpty) {
      return const Center(child: NoMoreDataWidget());
    }
    // 内容布局
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
        onRefresh: () => notifier.refresh(),
        displacement: 50,
        edgeOffset: 0,
        strokeWidth: 2.5,
        child: Stack(
          children: [
            ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              separatorBuilder: (context, index) => const Divider(),
              controller: scrollController,
              itemCount: news.length + (state.hasNextPage ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == news.length) {
                  return const SizedBox.shrink();
                }
                return TagListItem(
                  tag: news[index],
                  isFollowing: false,
                  onFollowTap: () {},
                );
              },
            ),
            if (state.isLoadingMore && news.isNotEmpty)
              const Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(child: LoadingIndicator()))
          ],
        ),
      ),
    );
  }
}
