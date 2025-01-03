import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/presentation/page/news_detail_page.dart';
import 'package:topnews/features/news/presentation/page/news_home_page.dart';

part 'app_router.g.dart';

/// 路由名称常量
class RouteNames {
  static const home = 'home';
  static const newsDetail = 'news-detail';
}

/// 路由路径常量
class RoutePaths {
  static const home = '/';
  static const newsDetail = '/news/:id';
}

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: RoutePaths.home,
        name: RouteNames.home,
        builder: (context, state) => const NewsHomePage(),
      ),
      GoRoute(
        path: RoutePaths.newsDetail,
        name: RouteNames.newsDetail,
        builder: (context, state) {
          final newsId = state.pathParameters['id']!;
          return NewsDetailPage(newsId: newsId);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(
          '页面不存在: ${state.uri}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    ),
  );
}

/// 路由扩展方法
extension RouterExtension on BuildContext {
  /// 导航到新闻详情页
  void pushNewsDetail(NewsEntity news) {
    goNamed(
      RouteNames.newsDetail,
      pathParameters: {'id': news.id},
      extra: news,
    );
  }
}
