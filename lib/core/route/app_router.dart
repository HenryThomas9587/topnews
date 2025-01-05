import 'package:go_router/go_router.dart';
import 'package:topnews/features/main/presentation/page/main_page.dart';
import 'package:topnews/features/home/presentation/page/news_detail_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainPage(),
      routes: [
        GoRoute(
          path: 'news/:newsId',
          builder: (context, state) => NewsDetailPage(
            newsId: state.pathParameters['newsId']!,
          ),
        ),
      ],
    ),
  ],
);
