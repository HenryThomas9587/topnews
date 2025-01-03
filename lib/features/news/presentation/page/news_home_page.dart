import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/constant/app_constants.dart';
import 'package:topnews/core/theme/app_theme_provider.dart';
import 'package:topnews/features/news/presentation/provider/news_provider.dart';
import 'package:topnews/features/news/presentation/widget/news_list_item.dart';
import 'package:topnews/core/route/app_router.dart';

class NewsHomePage extends HookConsumerWidget {
  const NewsHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsyncValue = ref.watch(newsNotifierProvider);
    final themeMode = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: Icon(themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).setThemeMode(
                    themeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark,
                  );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(newsNotifierProvider.notifier).refresh(),
        child: newsAsyncValue.when(
          data: (newsList) => ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) => NewsListItem(
              news: newsList[index],
              onTap: () => context.pushNewsDetail(newsList[index]),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: SelectableText.rich(
              TextSpan(
                text: '加载失败: ',
                children: [
                  TextSpan(
                    text: error.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
