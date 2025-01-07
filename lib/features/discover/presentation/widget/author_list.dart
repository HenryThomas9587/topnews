import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/discover/domain/entity/discover_section.dart';
import 'package:topnews/features/discover/presentation/provider/author_provider.dart';
import 'package:topnews/features/discover/presentation/widget/follow_card.dart';
import 'package:topnews/core/widget/base_section.dart';

class AuthorList extends ConsumerWidget {
  const AuthorList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authorsAsync = ref.watch(authorNotifierProvider);
    final notifier = ref.read(authorNotifierProvider.notifier);

    return BaseSection(
      title: DiscoverType.authors.value,
      onViewAll: () {
        // TODO: Navigate to authors page
      },
      child: SizedBox(
        height: 140,
        child: authorsAsync.when(
          data: (authors) => ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: authors.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppTheme.spaceSm),
            itemBuilder: (context, index) {
              final author = authors[index];
              return FollowCard(
                name: author.name,
                imageUrl: author.imageUrl,
                isFollowing: author.isFollowing,
                onFollowTap: () => notifier.toggleFollow(author.id),
              );
            },
          ),
          loading: () => const Center(child: LoadingIndicator()),
          error: (error, stack) => Center(child: ErrorView(error: error)),
        ),
      ),
    );
  }
}
