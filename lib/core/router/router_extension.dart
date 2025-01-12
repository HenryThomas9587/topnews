import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';

extension RouterExtension on BuildContext {
  void pushNewsPublish() {
    push('/newsPublish');
  }

  void pushNewsDraft(String id) {
    push('/newsDraft/$id');
  }

  void pushNewsList(String type, String? query) {
    if (query != null) {
      push('/newsList/$type?query=$query');
    } else {
      push('/newsList/$type');
    }
  }

  void pushNewsTab(String type) {
    push('/newsTab/$type');
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

  void pushSearch() {
    push('/search/record');
  }

  void pushSearchResults(String query) {
    push('/search/results?q=$query');
  }
}
