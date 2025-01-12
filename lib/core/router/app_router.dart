import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:topnews/features/main/presentation/page/main_page.dart';
import 'package:topnews/features/news/presentation/page/news_detail_page.dart';
import 'package:topnews/features/news/presentation/page/news_draft_page.dart';
import 'package:topnews/features/news/presentation/page/news_list_page.dart';
import 'package:topnews/features/news/presentation/page/news_publish_page.dart';
import 'package:topnews/features/news/presentation/page/news_tabs_page.dart';
import 'package:topnews/features/profile/domain/entity/user_profile_entity.dart';
import 'package:topnews/features/profile/presentation/page/edit_profile_page.dart';
import 'package:topnews/features/profile/presentation/page/settings_page.dart';
import 'package:topnews/features/profile/presentation/page/personal_info_page.dart';
import 'package:topnews/features/profile/presentation/page/notification_settings_page.dart';
import 'package:topnews/features/discover/presentation/page/search_record_page.dart';
import 'package:topnews/features/discover/presentation/page/search_results_page.dart';

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
      path: '/newsPublish',
      builder: (context, state) => const NewsPublishPage(),
    ),
    GoRoute(
      path: '/newsDraft/:id',
      builder: (context, state) => NewsDraftPreviewPage(
        id: state.pathParameters['id'] ?? '',
      ),
    ),
    GoRoute(
      path: '/newsTab/:type',
      builder: (context, state) =>
          NewsTabsPage(type: state.pathParameters['type'] ?? ''),
    ),
    GoRoute(
      path: '/newsList/:type',
      builder: (context, state) => NewsListPage(
        type: state.pathParameters['type'] ?? '',
        query: state.uri.queryParameters['query'] ?? '',
      ),
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
    GoRoute(
      path: '/search/record',
      builder: (context, state) => const SearchRecordPage(),
    ),
    GoRoute(
      path: '/search/results',
      builder: (context, state) {
        final query = state.uri.queryParameters['q'] ?? '';
        return SearchResultsPage(searchQuery: query);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri.toString()}'),
    ),
  ),
);
