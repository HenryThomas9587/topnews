import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';

extension RouterExtension on BuildContext {
  void pushNewsList(String title) {
    push('/news/$title');
  }

  void pushNewsTab(String title) {
    push('/newsTab/$title');
  }

  void pushNewsDetail(String id) {
    push('/newsDetail/$id');
  }

  void pushEditProfile(UserProfileEntity user) {
    push('/profile/edit', extra: user);
  }

  void pushSettings() {
    push('/settings');
  }

  void pushPersonalInfo() {
    push('/settings/personal-info');
  }

  void pushNotificationSettings() {
    push('/settings/notification');
  }
}
