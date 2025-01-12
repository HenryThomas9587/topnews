import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/app_button.dart';
import 'package:topnews/core/widget/user_avatar.dart';
import 'package:topnews/features/discover/domain/entity/author_entity.dart';

class AuthorListItem extends StatelessWidget {
  final AuthorEntity author;
  const AuthorListItem({
    super.key,
    required this.author,
    required this.onFollowChanged,
  });

  final void Function(AuthorEntity author) onFollowChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spaceMd,
        vertical: AppTheme.spaceXs,
      ),
      leading: UserAvatar(
        imageUrl: author.imageUrl,
        radius: 40,
      ),
      title: Text(
        author.name,
        style: theme.textTheme.bodyLarge,
      ),
      trailing: AppButton(
        isChecked: author.isFollowing,
        onTap: () => onFollowChanged(author),
        text: 'Follow',
        checkedText: 'Following',
      ),
    );
  }
}
