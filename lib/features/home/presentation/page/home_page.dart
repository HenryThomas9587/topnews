import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/features/home/domain/entity/home_section.dart';
import 'package:topnews/features/home/presentation/provider/home_provider.dart';
import 'package:topnews/core/widgets/common_widgets.dart';
import 'package:topnews/features/home/presentation/widget/home_app_bar.dart';
import 'package:topnews/features/home/presentation/widget/section_renderer.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final sectionsAsyncValue = ref.watch(homeNotifierProvider);
    final notifier = ref.watch(homeNotifierProvider.notifier);
    final showToTopButton = useState(false);

    // 滚动到顶部
    void scrollToTop() {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;
        final position = scrollController.position;

        // 更新置顶按钮显示状态
        if (position.pixels > 1000) {
          if (!showToTopButton.value) {
            showToTopButton.value = true;
          }
        } else if (showToTopButton.value) {
          showToTopButton.value = false;
        }

        // 处理加载更多
        if (position.pixels >= position.maxScrollExtent) {
          notifier.loadMoreData();
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await notifier.refresh();
          if (scrollController.hasClients) {
            scrollController.jumpTo(0);
          }
        },
        displacement: 44,
        edgeOffset: 0,
        child: sectionsAsyncValue.when(
          data: (sections) => NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollEndNotification) {
                final metrics = notification.metrics;
                if (metrics.pixels >= metrics.maxScrollExtent) {
                  notifier.loadMoreData();
                }
              }
              return true;
            },
            child: CustomScrollView(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              slivers: [
                const HomeAppBar(),
                ...sections.map((section) => SectionRenderer(section: section)),
                if (notifier.isLoadingMore)
                  const LoadingIndicator()
                else if (!sections.any((s) => s.type == HomeSectionType.story))
                  const NoMoreDataWidget(),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
              ],
            ),
          ),
          loading: () => const CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            slivers: [
              HomeAppBar(),
              SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
          error: (error, stack) => CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            slivers: [
              const HomeAppBar(),
              ErrorView(error: error),
            ],
          ),
        ),
      ),
      floatingActionButton: showToTopButton.value
          ? FloatingActionButton(
              onPressed: scrollToTop,
              mini: true,
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}

// 添加防抖器类
class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
