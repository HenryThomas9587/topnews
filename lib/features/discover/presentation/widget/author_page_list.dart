import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/discover/config/author_type.dart';
import 'package:topnews/features/discover/config/user_type.dart';
import 'package:topnews/features/discover/presentation/provider/author_page_provider.dart';
import 'package:topnews/features/discover/presentation/widget/author_list_item.dart';
import 'package:throttling/throttling.dart';

class AuthorPageList extends HookConsumerWidget {
  const AuthorPageList({
    super.key,
    required this.authorType,
    required this.userType,
    this.query,
  });

  final AuthorType authorType;
  final UserType userType;
  final String? query;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final authorParam = useMemoized(
        () => AuthorParam(authorType, userType, query ?? ''),
        [authorType, userType, query]);
    final notifier = ref.read(authorPageNotifierProvider(authorParam).notifier);
    final state = ref.watch(authorPageNotifierProvider(authorParam));

    final throttleLoadMore = useMemoized(
        () => Throttling<Future<void>>(
            duration: const Duration(milliseconds: 200)),
        []);

    final throttleUpdateOffset = useMemoized(
        () => Throttling<void>(duration: const Duration(milliseconds: 100)),
        []);

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        // 更新滚动位置
        final currentScroll = scrollController.position.pixels;

        throttleUpdateOffset
            .throttle(() => notifier.updateScrollOffset(currentScroll));
        // 计算最大滚动位置
        final maxScroll = scrollController.position.maxScrollExtent;
        if (currentScroll >= maxScroll - 200 &&
            !state.isLoadingMore &&
            state.hasNextPage) {
          throttleLoadMore.throttle(() => notifier.loadNextPage());
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController, notifier, throttleLoadMore, throttleUpdateOffset]);

    return RefreshIndicator(
      onRefresh: () => notifier.refresh(),
      displacement: 50,
      edgeOffset: 0,
      strokeWidth: 2.5,
      child: state.data.when(
        data: (data) => data.isEmpty
            ? const Center(child: NoMoreDataWidget())
            : Stack(
                children: [
                  ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: AppTheme.spaceMd),
                    controller: scrollController,
                    itemCount: data.length + (state.hasNextPage ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == data.length) {
                        if (state.isLoadingMore && data.isNotEmpty) {
                          return const Center(child: LoadingIndicator());
                        }
                        return const SizedBox.shrink();
                      }
                      return AuthorListItem(
                          author: data[index],
                          onFollowChanged: (author) {
                            ref
                                .read(authorPageNotifierProvider(authorParam)
                                    .notifier)
                                .updateItemState(author);
                          });
                    },
                  ),
                ],
              ),
        error: (error, stackTrace) => const Center(child: ErrorView()),
        loading: () => const Center(child: LoadingIndicator()),
      ),
    );
  }
}
