import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/discover/presentation/provider/discover_provider.dart';
import 'package:topnews/features/discover/presentation/widget/discover_app_bar.dart';
import 'package:topnews/features/discover/presentation/widget/section_renderer.dart';

class DiscoverPage extends HookConsumerWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final sectionsAsync = ref.watch(discoverNotifierProvider);
    final notifier = ref.watch(discoverNotifierProvider.notifier);
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
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      appBar: const DiscoverAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          showToTopButton.value = false;
          return notifier.refresh();
        },
        displacement: 50,
        edgeOffset: 0,
        strokeWidth: 2.5,
        child: sectionsAsync.when(
          data: (sections) => ListView.separated(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: AppTheme.contentPadding,
            itemCount: sections.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppTheme.spaceLg),
            itemBuilder: (context, index) {
              return SectionRenderer(section: sections[index]);
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
