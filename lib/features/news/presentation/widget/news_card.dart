import 'package:flutter/material.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/news_action_bar.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:topnews/features/news/presentation/widget/author_info.dart';

class NewsCard extends StatelessWidget {
  final NewsEntity news;

  const NewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.pushNewsDetail(news.id),
        child: Padding(
          padding: AppTheme.cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _NewsMainContent(news: news),
              AppTheme.vSpaceMd,
              AuthorInfo(
                avatar: news.authorAvatar,
                author: news.author,
                publishedAt: news.publishedAt,
              ),
              AppTheme.vSpaceXs,
              NewsActionBar(
                views: news.views,
                comments: news.comments,
                onShare: () {},
                onBookmark: () {},
                onMore: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsMainContent extends StatelessWidget {
  final NewsEntity news;

  const _NewsMainContent({required this.news});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.title,
                style: theme.textTheme.bodyLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              AppTheme.vSpaceXs,
              Text(
                news.content,
                style: theme.textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        AppTheme.hSpaceMd,
        _NewsImage(imageUrl: news.imageUrl),
      ],
    );
  }
}

class _NewsImage extends StatelessWidget {
  final String imageUrl;

  const _NewsImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: AppTheme.imageBorderRadius,
      ),
      child: CachedNetworkImage(
        width: 120,
        height: 100,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (_, __) => const _ImagePlaceholder(),
        errorWidget: (_, __, ___) => const _ImageError(),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.surfaceContainerHighest,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}

class _ImageError extends StatelessWidget {
  const _ImageError();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.image_not_supported_outlined,
        color: theme.colorScheme.outline,
      ),
    );
  }
}
