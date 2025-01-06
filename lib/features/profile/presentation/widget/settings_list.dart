import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/core/theme/app_theme_provider.dart';
import 'package:topnews/features/profile/presentation/widget/section_title.dart';
import 'package:topnews/features/profile/presentation/widget/setting_item.dart';

class SettingsList extends ConsumerWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return ListView(
      children: [
        const SectionTitle(title: 'General'),
        SettingItem(
          icon: Icons.interests_outlined,
          title: 'Customize Interests',
          onTap: () {},
        ),
        SettingItem(
          icon: Icons.person_outline,
          title: 'Personal Info',
          onTap: () => context.pushPersonalInfo(),
        ),
        SettingItem(
          icon: Icons.notifications_outlined,
          title: 'Notification',
          onTap: () => context.pushNotificationSettings(),
        ),
        SettingItem(
          icon: Icons.security_outlined,
          title: 'Security',
          onTap: () {},
        ),
        SettingItem(
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
        const SectionTitle(title: 'About'),
        SettingItem(
          icon: Icons.people_outline,
          title: 'Follow us on Social Media',
          onTap: () {},
        ),
        SettingItem(
          icon: Icons.help_outline,
          title: 'Help Center',
          onTap: () {},
        ),
        SettingItem(
          icon: Icons.privacy_tip_outlined,
          title: 'Privacy Policy',
          onTap: () {},
        ),
        SettingItem(
          icon: Icons.info_outline,
          title: 'About Newstime',
          onTap: () {},
        ),
        SettingItem(
          icon: Icons.logout,
          title: 'Logout',
          titleColor: Colors.red,
          onTap: () {},
        ),
      ],
    );
  }
}
