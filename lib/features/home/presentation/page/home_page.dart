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

        if (!notifier.isLoadingMore &&
            position.pixels >= position.maxScrollExtent - 200) {
          notifier.loadMoreData();
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      appBar: const HomeAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          showToTopButton.value = false;
          return notifier.refresh();
        },
        displacement: 50,
        edgeOffset: 0,
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.surface,
        strokeWidth: 2.5,
        child: sectionsAsyncValue.when(
          data: (sections) => ListView.builder(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: const EdgeInsets.only(bottom: 20),
            itemCount: sections.length + 1,
            itemBuilder: (context, index) {
              if (index < sections.length) {
                return SectionRenderer(section: sections[index]);
              }

              if (notifier.isLoadingMore) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: LoadingIndicator(),
                );
              }

              if (!sections.any((s) => s.type == HomeSectionType.story)) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: NoMoreDataWidget(),
                );
              }

              return const SizedBox(height: 20);
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
