import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/util/date_formatter.dart';
import 'package:topnews/core/widget/image_error_placeholder.dart';
import 'package:topnews/core/widget/user_avatar.dart';
import 'package:topnews/features/news/domain/entity/trending_news_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:topnews/core/widget/app_label.dart';
import 'package:topnews/core/widget/news_action_bar.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
    required this.item,
  });

  final TrendingNewsEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => context.push('/news/${item.id}'),
        child: SizedBox(
          width: 280,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TrendingImage(item: item),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _NewsTitle(title: item.title),
                    const SizedBox(height: 2),
                    _NewsSubtitle(subtitle: item.subtitle),
                    const SizedBox(height: 4),
                    _AuthorInfo(
                      author: item.author,
                      avatar: item.authorAvatar,
                      publishedAt: item.publishedAt,
                    ),
                    const SizedBox(height: 4),
                    NewsActionBar(
                      views: item.views,
                      comments: item.comments,
                      onShare: () {},
                      onBookmark: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrendingImage extends StatelessWidget {
  final TrendingNewsEntity item;

  const _TrendingImage({required this.item});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.0,
      child: Stack(
        children: [
          _CoverImage(imageUrl: item.imageUrl),
          Padding(
            padding: const EdgeInsets.all(AppTheme.spaceMd),
            child: AppLabel(text: item.category),
          ),
        ],
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  final String imageUrl;

  const _CoverImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppTheme.imageBorderTopRadius,
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const ImageErrorPlaceholder(),
      ),
    );
  }
}

class _NewsTitle extends StatelessWidget {
  final String title;

  const _NewsTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: 13,
            height: 1.2,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _NewsSubtitle extends StatelessWidget {
  final String subtitle;

  const _NewsSubtitle({required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 12,
            height: 1.2,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final String author;
  final String avatar;
  final DateTime publishedAt;

  const _AuthorInfo({
    required this.author,
    required this.avatar,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        UserAvatar(
          imageUrl: avatar,
          radius: 8,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  author,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    height: 1.1,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                ' • ',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 11,
                  height: 1.1,
                ),
              ),
              Text(
                DateFormatter.timeAgo(publishedAt),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 11,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
