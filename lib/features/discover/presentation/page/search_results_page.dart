import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/features/discover/domain/entity/search_results_state.dart';
import 'package:topnews/features/discover/domain/entity/search_type.dart';
import 'package:topnews/features/discover/presentation/page/search_config.dart';
import 'package:topnews/features/discover/presentation/provider/search_results_provider.dart';
import 'package:topnews/features/discover/presentation/widget/search_filter_chip.dart';

class SearchResultsPage extends HookConsumerWidget {
  final String searchQuery;

  const SearchResultsPage({
    super.key,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 ref.read 获取 notifier，需要传入初始查询参数
    final notifier =
        ref.read(searchResultsNotifierProvider(searchQuery).notifier);

    // 使用 ref.watch 监听状态，需要传入初始查询参数
    final resultsState = ref.watch(searchResultsNotifierProvider(searchQuery));

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(searchQuery),
      ),
      body: Column(
        children: [
          _buildFilterChips(resultsState.activeTab, (SearchType type) {
            notifier.changeTab(type);
          }),
          Expanded(
            child: _buildResultsContent(resultsState),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(
      SearchType activeTab, Function(SearchType) onTabChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spaceMd),
      child: Row(
        children: SearchConfig.searchTypes
            .map((type) => Padding(
                padding: const EdgeInsets.only(right: AppTheme.spaceXs),
                child: SearchFilterChip(
                    label: type.value,
                    isSelected: activeTab == type,
                    onSelected: () => onTabChanged(type))))
            .toList(),
      ),
    );
  }

  Widget _buildResultsContent(SearchResultsState state) {
    final activeSearchType = state.activeTab;
    final searchWidget = SearchConfig.searchTypeWidgets[activeSearchType];
    if (searchWidget == null) {
      return const Center(
        child: Text('Unsupported Search Type'),
      );
    }
    return ScrollConfiguration(
      behavior: const AlwaysScrollableScrollBehavior(),
      child: searchWidget(state.query), // 注意传递 state.query
    );
  }
}

class AlwaysScrollableScrollBehavior extends ScrollBehavior {
  const AlwaysScrollableScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const AlwaysScrollableScrollPhysics();
  }
}
