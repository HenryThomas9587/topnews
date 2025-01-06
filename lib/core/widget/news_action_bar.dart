import 'package:flutter/material.dart';

class NewsActionBar extends StatelessWidget {
  final int views;
  final int comments;
  final VoidCallback? onShare;
  final VoidCallback? onBookmark;

  const NewsActionBar({
    super.key,
    required this.views,
    required this.comments,
    this.onShare,
    this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        StatItem(
          icon: Icons.remove_red_eye_outlined,
          value: views.toString(),
        ),
        const SizedBox(width: 8),
        StatItem(
          icon: Icons.chat_bubble_outline,
          value: comments.toString(),
        ),
        const Spacer(),
        SizedBox(
          height: 20,
          child: IconButton(
            icon: const Icon(Icons.share_outlined),
            iconSize: 14,
            color: theme.colorScheme.onSurfaceVariant,
            onPressed: onShare,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 20,
          child: IconButton(
            icon: const Icon(Icons.bookmark_outline),
            iconSize: 14,
            color: theme.colorScheme.onSurfaceVariant,
            onPressed: onBookmark,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const StatItem({
    super.key,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 2),
        Text(
          value,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontSize: 11,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
