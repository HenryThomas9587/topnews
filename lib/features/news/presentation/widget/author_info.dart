import 'package:flutter/material.dart';
import 'package:topnews/core/util/date_formatter.dart';
import 'package:topnews/core/widget/user_avatar.dart';

class AuthorInfo extends StatelessWidget {
  final String avatar;
  final String author;
  final DateTime publishedAt;

  const AuthorInfo({
    super.key,
    required this.avatar,
    required this.author,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodySmall;
    final secondaryStyle = textStyle?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    return Row(
      children: [
        UserAvatar(
          imageUrl: avatar,
          radius: 8,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  author,
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(' • ', style: secondaryStyle),
              Text(
                DateFormatter.timeAgo(publishedAt),
                style: secondaryStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
