import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/user_avatar.dart';
import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfileEntity user;
  final VoidCallback onAvatarTap;

  const ProfileHeader({
    super.key,
    required this.user,
    required this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAvatarTap,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(user.avatarUrl),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  final UserProfileEntity user;

  const _UserInfo({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.fullName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          user.username,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}

class _WebsiteLink extends StatelessWidget {
  final String website;

  const _WebsiteLink({required this.website});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, // TODO: 打开网站
      child: Text(
        website,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
