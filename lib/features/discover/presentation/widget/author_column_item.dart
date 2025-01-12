import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/discover/domain/entity/author_entity.dart';
import 'package:topnews/features/discover/presentation/provider/author_follow_provider.dart';
import 'package:topnews/features/discover/presentation/widget/follow_card.dart';

class AuthorColumnItem extends ConsumerWidget {
  final AuthorEntity author;
  final ValueChanged<AuthorEntity>? onFollowChanged;

  const AuthorColumnItem({
    super.key,
    required this.author,
    this.onFollowChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logDebug('AuthorColumnItem build: $hashCode, ${author.id}');
    final isFollowing = ref.watch(authorFollowNotifierProvider
        .select((state) => state[author.id] ?? author.isFollowing));

    return FollowCard(
      key: ValueKey(author.id),
      name: author.name,
      imageUrl: author.imageUrl,
      isFollowing: isFollowing,
      onFollowTap: () async {
        final success = await ref
            .read(authorFollowNotifierProvider.notifier)
            .toggleFollow(author.id, isFollowing);

        if (success) {
          onFollowChanged?.call(author.copyWith(isFollowing: !isFollowing));
        }
      },
    );
  }
}
