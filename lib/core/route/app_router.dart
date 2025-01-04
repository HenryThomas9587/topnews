import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:topnews/features/home/presentation/page/home_page.dart';
import 'package:topnews/features/home/presentation/page/news_detail_page.dart';
import 'package:topnews/features/main/presentation/page/main_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MainPage(child: child),
      routes: [
        // Home Tab
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePage(),
          ),
          routes: [
            GoRoute(
              path: 'news/:id',
              builder: (context, state) => NewsDetailPage(
                newsId: state.pathParameters['id']!,
              ),
            ),
          ],
        ),
        // Explore Tab
        GoRoute(
          path: '/explore',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Placeholder(),
          ),
        ),
        // Bookmarks Tab
        GoRoute(
          path: '/bookmarks',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Placeholder(),
          ),
        ),
        // Profile Tab
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Placeholder(),
          ),
        ),
      ],
    ),
  ],
);
