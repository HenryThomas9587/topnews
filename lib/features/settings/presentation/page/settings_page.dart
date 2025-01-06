import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/theme/app_theme_provider.dart';
import 'package:topnews/features/profile/presentation/widget/setting_item.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const _SectionTitle(title: 'General'),
          _SettingItem(
            icon: Icons.interests_outlined,
            title: 'Customize Interests',
            onTap: () {},
          ),
          _SettingItem(
            icon: Icons.person_outline,
            title: 'Personal Info',
            onTap: () {},
          ),
          _SettingItem(
            icon: Icons.notifications_outlined,
            title: 'Notification',
            onTap: () {},
          ),
          _SettingItem(
            icon: Icons.security_outlined,
            title: 'Security',
            onTap: () {},
          ),
          _SettingItem(
            icon: Icons.language_outlined,
            title: 'Language',
            trailing: const Text('English (US)'),
            onTap: () {},
          ),
          SettingItem(
            icon: Icons.dark_mode_outlined,
            title: 'Dark Mode',
            trailing: Switch(
              value: themeMode == ThemeMode.dark,
              onChanged: (value) {
                ref
                    .read(themeNotifierProvider.notifier)
                    .setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
            onTap: () {},
          ),
          const Divider(),
          const _SectionTitle(title: 'About'),
          _SettingItem(
            icon: Icons.people_outline,
            title: 'Follow us on Social Media',
            onTap: () {},
          ),
          _SettingItem(
            icon: Icons.help_outline,
            title: 'Help Center',
            onTap: () {},
          ),
          _SettingItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () {},
          ),
          _SettingItem(
            icon: Icons.info_outline,
            title: 'About Newstime',
            onTap: () {},
          ),
          _SettingItem(
            icon: Icons.logout,
            title: 'Logout',
            titleColor: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;
  final Color? titleColor;

  const _SettingItem({
    required this.icon,
    required this.title,
    this.trailing,
    required this.onTap,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
