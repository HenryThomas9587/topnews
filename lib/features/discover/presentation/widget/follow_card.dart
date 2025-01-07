import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/user_avatar.dart';

class FollowCard extends StatelessWidget {
  const FollowCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.isFollowing,
    required this.onFollowTap,
  });

  final String name;
  final String imageUrl;
  final bool isFollowing;
  final VoidCallback onFollowTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            UserAvatar(
              imageUrl: imageUrl,
              radius: 24,
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 24,
              child: TextButton(
                onPressed: onFollowTap,
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppTheme.boxBorderRadius,
                    side: BorderSide(
                      color: isFollowing
                          ? Colors.transparent
                          : theme.colorScheme.outline,
                    ),
                  ),
                  backgroundColor: isFollowing
                      ? theme.colorScheme.primary
                      : Colors.transparent,
                ),
                child: Text(
                  isFollowing ? 'Following' : 'Follow',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: isFollowing
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
