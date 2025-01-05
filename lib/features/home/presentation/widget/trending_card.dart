import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/util/date_formatter.dart';
import 'package:topnews/core/widget/image_error_placeholder.dart';
import 'package:topnews/features/home/domain/entity/trending_news_entity.dart';
import 'package:go_router/go_router.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
    required this.item,
  });

  final TrendingNewsEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.push('/news/${item.id}'),
        child: SizedBox(
          width: 300,
          height: 340,
          child: Column(
            children: [
              _TrendingImage(item: item),
              _TrendingContent(item: item),
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
      aspectRatio: 2.2,
      child: Stack(
        children: [
          _CoverImage(imageUrl: item.imageUrl),
          _CategoryLabel(category: item.category),
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
      borderRadius: AppTheme.cardStyle['imageBorderRadius'],
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

class _CategoryLabel extends StatelessWidget {
  final String category;

  const _CategoryLabel({required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      top: 12,
      left: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spaceMd,
          vertical: AppTheme.spaceXs,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.9),
          borderRadius: BorderRadius.circular(
            (AppTheme.cardStyle['categoryRadius'] as num).toDouble(),
          ),
        ),
        child: Text(
          category,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _TrendingContent extends StatelessWidget {
  final TrendingNewsEntity item;

  const _TrendingContent({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spaceMd,
        vertical: AppTheme.spaceSm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _NewsTitle(title: item.title),
          const SizedBox(height: AppTheme.spaceXs),
          _NewsSubtitle(subtitle: item.subtitle),
          const SizedBox(height: AppTheme.spaceSm),
          _AuthorInfo(
            author: item.author,
            avatar: item.authorAvatar,
            publishedAt: item.publishedAt,
          ),
        ],
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
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            height: 1.1,
            fontSize: 15,
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
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.1,
            fontSize: 12,
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
    return Row(
      children: [
        CircleAvatar(
          radius: (AppTheme.cardStyle['avatarRadius'] as num).toDouble(),
          backgroundImage: NetworkImage(avatar),
        ),
        const SizedBox(width: AppTheme.spaceXs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                author,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      height: 1.1,
                      fontSize: 12,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                DateFormatter.timeAgo(publishedAt),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      height: 1.1,
                      fontSize: 11,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
