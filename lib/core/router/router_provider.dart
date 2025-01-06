import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:topnews/core/router/app_router.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return appRouter;
}
