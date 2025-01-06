import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/news/presentation/provider/news_page_provider.dart';
import 'package:topnews/features/news/presentation/widget/news_list.dart';

class NewsListSection extends ConsumerWidget {
  const NewsListSection({
    super.key,
    required this.categoryId,
  });

  final int categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsPageNotifierProvider(categoryId));
    final notifier = ref.read(newsPageNotifierProvider(categoryId).notifier);

    return state.data.when(
      data: (news) => news.isEmpty
          ? const Center(child: NoMoreDataWidget())
          : NewsList(
              news: news,
              onRefresh: notifier.refresh,
              onLoadMore: notifier.loadNextPage,
              hasNextPage: state.hasNextPage,
              isLoadingMore: state.isLoadingMore,
              initialScrollOffset: state.scrollOffset,
              onScrollOffsetChanged: (offset) {
                notifier.updateScrollOffset(offset);
              },
            ),
      loading: () => const Center(child: LoadingIndicator()),
      error: (error, stack) => Center(child: ErrorView(error: error)),
    );
  }
}
