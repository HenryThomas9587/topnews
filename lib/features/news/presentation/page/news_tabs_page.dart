import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/news/config/news_type.dart';
import 'package:topnews/features/news/domain/entity/category_entity.dart';
import 'package:topnews/features/news/presentation/provider/news_tabs_provider.dart';
import 'package:topnews/features/news/presentation/widget/news_page_list.dart';
import 'package:topnews/features/news/presentation/widget/news_tab_bar.dart';

class NewsTabsPage extends ConsumerWidget {
  const NewsTabsPage({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsAsync = ref.watch(newsTabsProviderProvider);
    final type = NewsType.values.firstWhere((e) => e.name == this.type);
    return Scaffold(
      appBar: AppBar(
        title: Text(type.label),
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
                    child: _buildTabView(tabs, controller),
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

  Widget _buildTabView(List<CategoryEntity> tabs, TabController controller) {
    return TabBarView(
      controller: controller,
      children: tabs
          .map((category) => NewsPageList(
                newsType: NewsType.search,
                query: category.name,
              ))
          .toList(),
    );
  }
}
