import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
    required this.isFollowing,
    required this.onTap,
  });

  final bool isFollowing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spaceSm,
          vertical: AppTheme.spaceXs,
        ),
        decoration: BoxDecoration(
          color: isFollowing ? Colors.transparent : theme.colorScheme.primary,
          border: Border.all(
            color: theme.colorScheme.primary,
          ),
          borderRadius: AppTheme.boxBorderRadius,
        ),
        child: Text(
          isFollowing ? 'Following' : 'Follow',
          style: theme.textTheme.bodySmall?.copyWith(
            color: isFollowing
                ? theme.colorScheme.primary
                : theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
