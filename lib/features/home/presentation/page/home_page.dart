import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/features/home/presentation/provider/home_provider.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/home/presentation/widget/home_app_bar.dart';
import 'package:topnews/features/home/presentation/widget/section_renderer.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showToTopButton = useState(false);
    final scrollController = useScrollController();
    final homeState = ref.watch(homeNotifierProvider);
    final notifier = ref.read(homeNotifierProvider.notifier);

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

        if (position.pixels > 1000) {
          if (!showToTopButton.value) {
            showToTopButton.value = true;
          }
        } else if (showToTopButton.value) {
          showToTopButton.value = false;
        }

        if (position.pixels >= position.maxScrollExtent - 200) {
          notifier.loadMoreData();
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController, homeState]); // 添加 homeState 作为依赖

    return Scaffold(
      appBar: const HomeAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          showToTopButton.value = false;
          return notifier.refresh();
        },
        displacement: 50,
        edgeOffset: 0,
        strokeWidth: 2.5,
        child: homeState.when(
          data: (state) => ListView.builder(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: AppTheme.contentPadding,
            itemCount: state.sections.length +
                (state.hasMore || state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < state.sections.length) {
                return SectionRenderer(section: state.sections[index]);
              }

              // 优化：根据 state.isLoadingMore 决定是否显示加载更多
              if (state.isLoadingMore) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: LoadingIndicator(),
                );
              }
              // 优化：根据 state.hasMore 判断是否显示 "No More Data"
              if (!state.hasMore && state.sections.isNotEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: NoMoreDataWidget(),
                );
              }
              return const SizedBox(height: 20); // 可以移除，因为 itemCount 已经做了控制
            },
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: ErrorView(error: error),
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
