import 'package:flutter/material.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/util/date_formatter.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/core/widget/user_avatar.dart';

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
              const SizedBox(height: 12),
              _NewsAuthorInfo(news: news),
              const SizedBox(height: 12),
              _NewsStats(story: news),
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
              const SizedBox(height: 4),
              Text(
                news.content,
                style: theme.textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        if (news.imageUrl != null) ...[
          const SizedBox(width: 12),
          _NewsImage(imageUrl: news.imageUrl!),
        ],
      ],
    );
  }
}

class _NewsImage extends StatelessWidget {
  final String imageUrl;

  const _NewsImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: 180,
        height: 130,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 180,
          height: 130,
          color: theme.colorScheme.surface,
          child: Icon(
            Icons.image_not_supported_outlined,
            color: theme.colorScheme.outline,
          ),
        ),
      ),
    );
  }
}

class _NewsAuthorInfo extends StatelessWidget {
  final NewsEntity news;

  const _NewsAuthorInfo({required this.news});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        UserAvatar(
          imageUrl: news.authorAvatar,
        ),
        const SizedBox(width: AppTheme.spaceXs),
        Text(
          news.author ?? '',
          style: theme.textTheme.bodySmall,
        ),
        const Spacer(),
        Text(
          DateFormatter.timeAgo(news.publishedAt),
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _NewsStats extends StatelessWidget {
  final NewsEntity story;

  const _NewsStats({required this.story});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatItem(
          icon: Icons.remove_red_eye_outlined,
          value: story.views.toString(),
        ),
        const SizedBox(width: 16),
        _StatItem(
          icon: Icons.chat_bubble_outline,
          value: story.comments.toString(),
        ),
        const Spacer(),
        _ActionButton(
          icon: Icons.share_outlined,
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        _ActionButton(
          icon: Icons.more_horiz,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const _StatItem({
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      icon: Icon(icon),
      iconSize: 18,
      color: theme.colorScheme.onSurface,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
