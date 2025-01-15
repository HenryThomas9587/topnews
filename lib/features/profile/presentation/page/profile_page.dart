import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/features/profile/presentation/provider/profile_provider.dart';
import 'package:topnews/features/profile/presentation/widget/profile_content.dart';
import 'package:topnews/features/profile/presentation/widget/profile_header.dart';
import 'package:topnews/features/profile/presentation/widget/profile_stats.dart';
import 'package:image_picker/image_picker.dart';
import 'package:topnews/core/util/app_permission.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notify = ref.read(profileProvider('1').notifier);
    final profileAsync = ref.watch(profileProvider('1'));
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
              onPressed: () => context.pushNewsPublish(),
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
            ProfileHeader(user: user, onAvatarTap: () => _pickImage(notify)),
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

  Future<void> _pickImage(Profile notify) async {
    final hasPermission = await AppPermission.requestPhotoOrStoragePermission();
    if (hasPermission) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        notify.uploadAvatar(pickedFile.path);
      }
    } else {
      // TODO: 处理权限被拒绝的情况，弹窗提示，跳转app设置
    }
  }
}
