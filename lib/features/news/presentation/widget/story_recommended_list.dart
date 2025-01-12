import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/core/widget/base_section.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/news/config/news_type.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/presentation/provider/news_page_provider.dart';
import 'package:topnews/features/news/presentation/widget/story_card.dart';

class StoryRecommendedList extends HookConsumerWidget {
  const StoryRecommendedList({super.key, required this.newsType});

  final NewsType newsType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsParam = useMemoized(() => NewsParam(newsType, ''), [newsType]);
    final newsData = ref.watch(
        newsPageNotifierProvider(newsParam).select((state) => state.data));
    final notifier = ref.read(newsPageNotifierProvider(newsParam).notifier);
    logDebug("StoryRecommendedList build:$hashCode");
    return BaseSection(
      title: newsType.label,
      onViewAll: () {
        context.pushNewsList(newsType.name, '');
      },
      child: SizedBox(
        height: AppTheme.storyCardHeight,
        width: double.infinity,
        child: newsData.when(
          data: (news) => _buildNewsList(news),
          loading: () => const Center(child: LoadingIndicator()),
          error: (error, stack) => ErrorView(
            error: error,
            onRetry: () => notifier.refresh(),
          ),
        ),
      ),
    );
  }

  Widget _buildNewsList(List<NewsEntity> news) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      physics: const BouncingScrollPhysics(),
      itemCount: news.length,
      separatorBuilder: (_, __) => const SizedBox(width: AppTheme.spaceSm),
      itemBuilder: (context, index) => StoryCard(
        key: Key(news[index].id.toString()),
        item: news[index],
      ),
    );
  }
}
