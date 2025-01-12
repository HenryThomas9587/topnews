import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/app_button.dart';
import 'package:topnews/core/widget/user_avatar.dart';

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.isFollowing,
    required this.onFollowTap,
    this.showFollowButton = true,
    this.avatarRadius = 24,
  });

  final String name;
  final String imageUrl;
  final bool isFollowing;
  final VoidCallback onFollowTap;
  final bool showFollowButton;
  final double avatarRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UserAvatar(
          radius: avatarRadius,
          imageUrl: imageUrl,
        ),
        const SizedBox(height: AppTheme.spaceXs),
        Text(
          name,
          style: theme.textTheme.titleSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showFollowButton) ...[
          const SizedBox(height: AppTheme.spaceXs),
          AppButton(
            isChecked: isFollowing,
            onTap: onFollowTap,
            text: 'Follow',
            checkedText: 'Following',
          ),
        ],
      ],
    );
  }
}
