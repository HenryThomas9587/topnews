import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/follow_button.dart';
import 'package:topnews/core/widget/user_avatar.dart';

class PublisherInfo extends StatelessWidget {
  const PublisherInfo({
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

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        UserAvatar(
          radius: 24,
          imageUrl: imageUrl,
        ),
        const SizedBox(width: AppTheme.spaceSm),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: theme.textTheme.titleSmall,
            ),
            FollowButton(
              isFollowing: isFollowing,
              onTap: onFollowTap,
            ),
          ],
        ),
        const SizedBox(width: AppTheme.spaceMd),
      ],
    );
  }
}
