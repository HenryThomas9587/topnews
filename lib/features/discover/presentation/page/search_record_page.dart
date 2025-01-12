import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/features/discover/presentation/provider/search_history_provider.dart';
import 'package:topnews/features/discover/presentation/widget/search_history_item.dart';
import 'package:topnews/core/router/router_extension.dart';

class SearchRecordPage extends ConsumerWidget {
  const SearchRecordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: _SearchInput(),
      ),
      body: ListView(
        padding: AppTheme.contentPadding,
        children: [
          _buildRecentSearches(context, ref),
        ],
      ),
    );
  }

  Widget _buildRecentSearches(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(searchHistoryNotifierProvider.notifier);
    final searchHistory = ref.watch(searchHistoryNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context, ref),
        const SizedBox(height: AppTheme.spaceSm),
        searchHistory.when(
          data: (history) {
            if (history.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: AppTheme.spaceMd),
                child: Text(
                  "No recent searches",
                  textAlign: TextAlign.center,
                ),
              );
            }
            return Column(
              children: history
                  .map((entity) => SearchHistoryItem(
                        keyword: entity.keyword,
                        onTap: () => context.pushSearchResults(entity.keyword),
                        onDelete: () => notifier.removeSearchHistory(entity.id),
                      ))
                  .toList(),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(searchHistoryNotifierProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recent Searches',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextButton(
          onPressed: () => notifier.clearSearchHistory(),
          child: Text(
            'Clear',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ],
    );
  }
}

class _SearchInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(searchHistoryNotifierProvider.notifier);
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search for news, topics...',
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
        border: InputBorder.none,
      ),
      onSubmitted: (value) {
        final trimmedValue = value.trim();
        if (trimmedValue.isNotEmpty) {
          notifier.addSearchHistory(trimmedValue);
          context.pushSearchResults(trimmedValue);
        }
      },
    );
  }
}
