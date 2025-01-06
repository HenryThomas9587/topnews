import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widget/user_avatar.dart';
import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';
import 'package:topnews/features/profile/presentation/provider/profile_provider.dart';

class EditProfilePage extends HookConsumerWidget {
  final UserProfileEntity user;

  const EditProfilePage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullNameController = useTextEditingController(text: user.fullName);
    final usernameController = useTextEditingController(text: user.username);
    final bioController = useTextEditingController(text: user.bio);
    final websiteController = useTextEditingController(text: user.website);

    final profileState = ref.watch(profileProvider(user.id));

    Future<void> saveProfile() async {
      final updated = UserProfileEntity(
        id: user.id,
        fullName: fullNameController.text,
        username: usernameController.text,
        bio: bioController.text,
        avatarUrl: user.avatarUrl,
        website: websiteController.text,
        stories: user.stories,
        followers: user.followers,
        following: user.following,
      );

      await ref.read(profileProvider(user.id).notifier).updateProfile(updated);
      if (context.mounted) {
        context.pop();
      }
    }

    Future<void> pickAvatar() async {
      // TODO: 实现图片选择和上传
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: profileState.isLoading ? null : saveProfile,
            child: const Text('Save'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.spaceLg),
        children: [
          Center(
            child: Stack(
              children: [
                UserAvatar(
                  imageUrl: user.avatarUrl,
                  radius: 40,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: pickAvatar,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 16,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppTheme.spaceLg),
          _EditField(
            label: 'Full Name',
            controller: fullNameController,
          ),
          const SizedBox(height: AppTheme.spaceMd),
          _EditField(
            label: 'Username',
            controller: usernameController,
            prefix: '@',
          ),
          const SizedBox(height: AppTheme.spaceMd),
          _EditField(
            label: 'Bio',
            controller: bioController,
            maxLines: 3,
          ),
          const SizedBox(height: AppTheme.spaceMd),
          _EditField(
            label: 'Website',
            controller: websiteController,
          ),
        ],
      ),
    );
  }
}

class _EditField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? prefix;
  final int? maxLines;

  const _EditField({
    required this.label,
    required this.controller,
    this.prefix,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: AppTheme.spaceXs),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixText: prefix,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spaceMd,
              vertical: AppTheme.spaceSm,
            ),
            border: OutlineInputBorder(
              borderRadius: AppTheme.boxBorderRadius,
            ),
          ),
        ),
      ],
    );
  }
}
