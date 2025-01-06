import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/widget/user_avatar.dart';
import 'package:topnews/features/profile/presentation/provider/profile_provider.dart';

class PersonalInfoPage extends HookConsumerWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider('current_user_id'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Info'),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: 保存个人信息
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: profileAsync.when(
        data: (user) => ListView(
          padding: const EdgeInsets.all(16),
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
                    child: _EditAvatarButton(
                      onTap: () {
                        // TODO: 修改头像
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _InfoField(
              label: 'Full Name',
              initialValue: user.fullName,
            ),
            const SizedBox(height: 16),
            _InfoField(
              label: 'Email',
              initialValue: 'andrew.ainsley@yourdomain.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            _InfoField(
              label: 'Phone Number',
              initialValue: '+1 (11 467 378 399',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            _InfoField(
              label: 'Date of Birth',
              initialValue: '12/27/1995',
              readOnly: true,
              onTap: () {
                // TODO: 显示日期选择器
              },
            ),
            const SizedBox(height: 16),
            _InfoField(
              label: 'Gender',
              initialValue: 'Male',
              readOnly: true,
              onTap: () {
                // TODO: 显示性别选择器
              },
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class _EditAvatarButton extends StatelessWidget {
  final VoidCallback onTap;

  const _EditAvatarButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
    );
  }
}

class _InfoField extends StatelessWidget {
  final String label;
  final String initialValue;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;

  const _InfoField({
    required this.label,
    required this.initialValue,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
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
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
