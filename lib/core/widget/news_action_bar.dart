import 'package:flutter/material.dart';

class NewsActionBar extends StatelessWidget {
  static const double _iconSize = 14;
  static const double _iconBoxSize = 22;
  static const double _actionIconSize = 18;
  static const double _height = 20;
  static const _hSpace = SizedBox(width: 8);
  static const _hSpaceSmall = SizedBox(width: 4);

  final int views;
  final int comments;
  final bool isBookmarked;
  final VoidCallback? onShare;
  final VoidCallback? onBookmark;
  final VoidCallback? onMore;

  const NewsActionBar({
    super.key,
    required this.views,
    required this.comments,
    this.isBookmarked = false,
    this.onShare,
    this.onBookmark,
    this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.onSurfaceVariant;

    return SizedBox(
      height: _height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Stats
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _StatItem(
                icon: Icons.remove_red_eye_outlined,
                value: _formatNumber(views),
                iconSize: _iconSize,
                color: color,
              ),
              _hSpace,
              _StatItem(
                icon: Icons.chat_bubble_outline,
                value: _formatNumber(comments),
                iconSize: _iconSize,
                color: color,
              ),
            ],
          ),
          const Spacer(),
          // Actions
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (onShare != null) ...[
                _ActionButton(
                  icon: Icons.share_outlined,
                  onPressed: onShare!,
                  iconSize: _actionIconSize,
                  color: color,
                ),
                _hSpace,
              ],
              if (onBookmark != null)
                _ActionButton(
                  icon: isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                  onPressed: onBookmark!,
                  iconSize: _actionIconSize,
                  color: isBookmarked ? theme.colorScheme.primary : color,
                ),
              if (onMore != null) ...[
                _hSpace,
                _ActionButton(
                  icon: Icons.more_horiz,
                  onPressed: onMore!,
                  iconSize: _actionIconSize,
                  color: color,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  String _formatNumber(int number) => number >= 10000
      ? '${(number / 10000).toStringAsFixed(1)}w'
      : number >= 1000
          ? '${(number / 1000).toStringAsFixed(1)}k'
          : number.toString();
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final double iconSize;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.iconSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: color),
          NewsActionBar._hSpaceSmall,
          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 1,
          ),
        ],
      );
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double iconSize;
  final Color color;

  const _ActionButton({
    required this.icon,
    required this.onPressed,
    required this.iconSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: NewsActionBar._iconBoxSize,
        height: iconSize,
        child: IconButton(
          icon: Icon(icon),
          iconSize: iconSize,
          color: color,
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          tooltip: _getTooltip(),
        ),
      );

  String _getTooltip() => icon == Icons.share_outlined
      ? '分享'
      : icon == Icons.bookmark || icon == Icons.bookmark_outline
          ? '收藏'
          : icon == Icons.more_horiz
              ? '更多'
              : '';
}
