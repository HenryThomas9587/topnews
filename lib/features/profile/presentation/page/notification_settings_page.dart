import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/features/profile/presentation/widget/settings_switch_item.dart';

class NotificationSettingsPage extends HookConsumerWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: ListView(
        children: [
          SettingsSwitchItem(
            icon: Icons.newspaper,
            title: 'Breaking news notifications',
            value: true,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.recommend,
            title: 'News recommendations',
            value: true,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.trending_up,
            title: 'Top story notifications',
            value: false,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.local_fire_department,
            title: 'Trending stories',
            value: true,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.calendar_today,
            title: 'Daily or weekly digest',
            value: false,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.people,
            title: 'Stories from those I follow',
            value: true,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.person_add,
            title: 'Someone is following me',
            value: true,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.comment,
            title: 'Someone commented on my story',
            value: true,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.reply,
            title: 'Someone replied to my comment',
            value: true,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.category,
            title: 'Category-specific notifications',
            value: false,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.bookmark,
            title: 'Saved article updates',
            value: false,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.event,
            title: 'Event reminders',
            value: false,
            onChanged: (value) {},
          ),
          SettingsSwitchItem(
            icon: Icons.notifications_off,
            title: 'Opt-out or quiet hours',
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
