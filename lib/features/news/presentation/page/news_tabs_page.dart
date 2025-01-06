import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/news/presentation/provider/news_tabs_provider.dart';
import 'package:topnews/features/news/presentation/widget/news_tab_bar.dart';
import 'package:topnews/features/news/presentation/widget/news_tab_view.dart';

class NewsTabsPage extends ConsumerWidget {
  const NewsTabsPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsAsync = ref.watch(newsTabsProviderProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: tabsAsync.when(
        data: (tabs) => DefaultTabController(
          length: tabs.length,
          child: Builder(
            builder: (context) {
              final controller = DefaultTabController.of(context);
              return Column(
                children: [
                  NewsTabBar(tabs: tabs, controller: controller),
                  Expanded(
                    child: NewsTabView(tabs: tabs, controller: controller),
                  ),
                ],
              );
            },
          ),
        ),
        loading: () => const Center(child: LoadingIndicator()),
        error: (error, stack) => Center(child: ErrorView(error: error)),
      ),
    );
  }
}
