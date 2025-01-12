import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/app_button.dart';
import 'package:topnews/features/discover/domain/entity/tag_entity.dart';

class TagListItem extends StatelessWidget {
  final TagEntity tag;
  final bool isFollowing;
  final VoidCallback onFollowTap;

  const TagListItem({
    super.key,
    required this.tag,
    required this.isFollowing,
    required this.onFollowTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spaceMd,
        vertical: AppTheme.spaceXs,
      ),
      leading: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: AppTheme.boxBorderRadius,
        ),
        child: Text(
          '#',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      title: Text(
        tag.name,
        style: theme.textTheme.bodyLarge,
      ),
      subtitle: Text(
        '${tag.newsCount} posts',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: AppButton(
        isChecked: isFollowing,
        onTap: onFollowTap,
        text: 'Follow',
        checkedText: 'Following',
      ),
    );
  }
}
