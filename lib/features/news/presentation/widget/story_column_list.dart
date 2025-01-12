import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/core/widget/base_section.dart';
import 'package:topnews/features/news/config/news_type.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/presentation/widget/story_card.dart';

class StoryColumnList extends HookConsumerWidget {
  const StoryColumnList({
    super.key,
    required this.news,
    required this.newsType,
  });

  final List<NewsEntity> news;
  final NewsType newsType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logDebug("StoryColumnList build:$hashCode");
    return BaseSection(
      title: newsType.label,
      onViewAll: () {
        context.pushNewsList(newsType.name, '');
      },
      child: SizedBox(
        height: AppTheme.storyCardHeight,
        width: double.infinity,
        child: _buildNewsList(news),
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
