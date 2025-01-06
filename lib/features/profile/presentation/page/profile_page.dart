import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/features/profile/presentation/provider/profile_provider.dart';
import 'package:topnews/features/profile/presentation/widget/profile_content.dart';
import 'package:topnews/features/profile/presentation/widget/profile_header.dart';
import 'package:topnews/features/profile/presentation/widget/profile_stats.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider('current_user_id'));
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() {
        // TODO: 实现滚动加载更多内容
      });
      return null;
    }, [scrollController]);

    return profileAsync.when(
      data: (user) => Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => context.pushSettings(),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => context.pushSettings(),
            ),
          ],
        ),
        body: ListView(
          controller: scrollController,
          children: [
            ProfileHeader(user: user),
            const Divider(),
            ProfileStats(user: user),
            const Divider(),
            ProfileContent(user: user),
          ],
        ),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
