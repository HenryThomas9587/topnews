import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/util/date_formatter.dart';
import 'package:topnews/features/home/domain/entity/story_entity.dart';
import 'package:go_router/go_router.dart';

class StoryCard extends StatelessWidget {
  final StoryEntity story;

  const StoryCard({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.push('/news/${story.id}'),
        child: Padding(
          padding: AppTheme.cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _StoryMainContent(story: story),
              const SizedBox(height: 12),
              _StoryAuthorInfo(story: story),
              const SizedBox(height: 12),
              _StoryStats(story: story),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoryMainContent extends StatelessWidget {
  final StoryEntity story;

  const _StoryMainContent({required this.story});

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
                story.title,
                style: theme.textTheme.bodyLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                story.content,
                style: theme.textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        if (story.imageUrl.isNotEmpty) ...[
          const SizedBox(width: 12),
          _StoryImage(imageUrl: story.imageUrl),
        ],
      ],
    );
  }
}

class _StoryImage extends StatelessWidget {
  final String imageUrl;

  const _StoryImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: 180,
        height: 150,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 180,
          height: 150,
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

class _StoryAuthorInfo extends StatelessWidget {
  final StoryEntity story;

  const _StoryAuthorInfo({required this.story});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage(story.authorAvatar),
          backgroundColor: theme.colorScheme.surface,
        ),
        const SizedBox(width: 8),
        Text(
          story.author,
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          DateFormatter.timeAgo(story.publishedAt),
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.outline,
          ),
        ),
      ],
    );
  }
}

class _StoryStats extends StatelessWidget {
  final StoryEntity story;

  const _StoryStats({required this.story});

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
          color: theme.colorScheme.outline,
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.outline,
          ),
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
      color: theme.colorScheme.outline,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
