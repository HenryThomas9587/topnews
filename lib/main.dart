import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/route/app_router.dart';
import 'package:topnews/core/constant/app_constants.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/theme/app_theme_provider.dart';
import 'package:topnews/core/util/app_directory.dart';
import 'package:topnews/core/util/storage_permission.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    // 仅在非Web平台初始化本地存储
    final appDocPath = await AppDirectory.getFilePath('');
    await AppDirectory.createDirectory(appDocPath);
    await Hive.initFlutter(appDocPath);
  } else {
    await Hive.initFlutter(); // Web平台简单初始化
  }

  // 请求存储权限
  await StoragePermission.request();

  // 加载保存的主题设置
  final container = ProviderContainer();
  await container.read(themeNotifierProvider.notifier).loadThemeMode();

  runApp(UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: AppConstants.appName,
      themeMode: themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}
