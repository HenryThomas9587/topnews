import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/base_section.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/discover/domain/entity/discover_section.dart';
import 'package:topnews/features/discover/presentation/provider/publisher_provider.dart';
import 'package:topnews/features/discover/presentation/widget/follow_card.dart';

class PublisherList extends ConsumerWidget {
  const PublisherList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publishersAsync = ref.watch(publisherNotifierProvider);
    final notifier = ref.read(publisherNotifierProvider.notifier);

    return BaseSection(
      title: DiscoverType.publishers.value,
      onViewAll: () {
        // TODO: Navigate to publishers page
      },
      child: SizedBox(
        height: 140,
        child: publishersAsync.when(
          data: (publishers) => ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: publishers.length,
            separatorBuilder: (context, index) => const SizedBox(width: AppTheme.spaceSm),
            itemBuilder: (context, index) {
              final publisher = publishers[index];
              return FollowCard(
                name: publisher.name,
                imageUrl: publisher.imageUrl,
                isFollowing: publisher.isFollowing,
                onFollowTap: () => notifier.toggleFollow(publisher.id),
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
