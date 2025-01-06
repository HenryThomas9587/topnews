import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:topnews/features/main/presentation/page/main_page.dart';
import 'package:topnews/features/news/presentation/page/news_detail_page.dart';
import 'package:topnews/features/news/presentation/page/news_page.dart';
import 'package:topnews/features/news/presentation/page/news_tabs_page.dart';
import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';
import 'package:topnews/features/profile/presentation/page/edit_profile_page.dart';
import 'package:topnews/features/profile/presentation/page/settings_page.dart';
import 'package:topnews/features/profile/presentation/page/personal_info_page.dart';
import 'package:topnews/features/profile/presentation/page/notification_settings_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainPage(),
      routes: [
        GoRoute(
          path: 'newsDetail/:newsId',
          builder: (context, state) => NewsDetailPage(
            newsId: state.pathParameters['newsId']!,
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/news/:title',
      builder: (context, state) =>
          NewsPage(title: state.pathParameters['title'] ?? ''),
    ),
    GoRoute(
      path: '/newsTab/:title',
      builder: (context, state) =>
          NewsTabsPage(title: state.pathParameters['title'] ?? ''),
    ),
    GoRoute(
      path: '/profile/edit',
      builder: (context, state) {
        final user = state.extra as UserProfileEntity;
        return EditProfilePage(user: user);
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/settings/personal-info',
      builder: (context, state) => const PersonalInfoPage(),
    ),
    GoRoute(
      path: '/settings/notification',
      builder: (context, state) => const NotificationSettingsPage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri.toString()}'),
    ),
  ),
);
