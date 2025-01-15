import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 浅色主题颜色定义
  static const lightColors = {
    'primary': Color(0xFF20958f), // primary: 主要颜色,用于主要按钮、重要操作等。
    'secondary': Color(0xFF03A9F4), // secondary: 次要颜色,用于次要按钮、辅助操作等
    'surface': Colors.white, // surface: 表面颜色,用于卡片、对话框等容器背景
    'surfaceTint': Colors.transparent, // surfaceTint: elevation 的表面上创建一个颜色叠加层
    'surfaceContainer': Colors.white, // surfaceContainer: 容器表面颜色,用于页面主体背景
    'surfaceVariant': Color(0xFFF7FFFE), // surfaceVariant: 表面变体颜色,用于不同层级的表面
    'onPrimary': Colors.white, // onPrimary: 在主色上的文字颜色
    'onSecondary': Colors.white, // onSecondary: 在次要颜色上的文字颜色
    'onSurface': Color(0xFF1e1e1e), // onSurface: 在表面上的主要文字颜色
    'onSurfaceVariant': Color(0xFFA3A3A3), // onSurfaceVariant: 在表面上的次要文字颜色
    'outline': Color(0xFFD1D1D6), // outline: 轮廓线颜色
    'outlineVariant': Color(0xFFD9D9D9), // outlineVariant: 轮廓线变体颜色
    'shadow': Color.fromARGB(255, 217, 217, 217), // shadow: 阴影颜色,用于卡片、对话框等容器背景
  };

  // 深色主题下各颜色的用途与浅色主题相同,但使用更深的色调
  static const darkColors = {
    'primary': Color(0xFF20958f),
    'secondary': Color(0xFF8F95FF),
    'surface': Color(0xFF121212),
    'surfaceTint': Colors.transparent,
    'surfaceContainer': Color(0xFF212121),
    'surfaceVariant': Color(0xFF303030),
    'onPrimary': Colors.white,
    'onSecondary': Colors.white,
    'onSurface': Colors.white,
    'onSurfaceVariant': Color(0xFFA1A1A1),
    'outline': Color(0xFF444444),
    'outlineVariant': Color(0xFF595959),
    'shadow': Color.fromARGB(255, 217, 217, 217),
  };

  // 定义基础文本样式
  static final _baseTextStyle = GoogleFonts.inter();

  // 图片配置
  static const avatarRadius = 10.0;
  static const imageRadius = 12.0;
  static const imageBorderTopRadius =
      BorderRadius.vertical(top: Radius.circular(imageRadius));
  static const imageBorderRadius =
      BorderRadius.all(Radius.circular(imageRadius));

  // 卡片配置
  static final cardBorderRadius = BorderRadius.circular(12.0);
  static final _cardShape =
      RoundedRectangleBorder(borderRadius: cardBorderRadius);
  static const _cardElevation = 2.0;
  static const cardPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);

  // box
  static final boxBorderRadius = BorderRadius.circular(12.0);
  static final boxShape = RoundedRectangleBorder(borderRadius: boxBorderRadius);
  static const boxElevation = 2.0;
  static const boxPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);

  // 文字配置
  static const _textTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
    labelLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    labelSmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
  );

  // 底部导航栏配置
  static const _navigationBarHeight = 64.0;
  static const _navigationBarElevation = 1.0;

  // 添加间距定义
  static const spaceXs = 4.0;
  static const spaceSm = 8.0;
  static const spaceMd = 16.0;
  static const spaceLg = 24.0;
  static const spaceXl = 32.0;
  static const contentPadding =
      EdgeInsets.symmetric(horizontal: spaceMd, vertical: spaceMd);

  // 卡片尺寸配置
  static const storyCardWidth = 280.0;
  static const storyCardHeight = 285.0;
  static const storyCardImageHeight = 140.0;
  static const storyCardPadding = EdgeInsets.all(12.0);

  static const followCardWidth = 100.0;
  static const followCardHeight = 140.0;
  static const followCardPadding = EdgeInsets.all(12.0);

  // 水平间距
  static const hSpaceXs = SizedBox(width: spaceXs);
  static const hSpaceSm = SizedBox(width: spaceSm);
  static const hSpaceMd = SizedBox(width: spaceMd);
  // 垂直间距
  static const vSpaceXs = SizedBox(height: spaceXs);
  static const vSpaceSm = SizedBox(height: spaceSm);
  static const vSpaceMd = SizedBox(height: spaceMd);

  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: _baseTextStyle.fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: lightColors['primary']!,
      primary: lightColors['primary']!,
      secondary: lightColors['secondary']!,
      surface: lightColors['surface']!,
      surfaceTint: lightColors['surfaceTint']!,
      surfaceContainerHighest: lightColors['surfaceVariant']!,
      onPrimary: lightColors['onPrimary']!,
      onSecondary: lightColors['onSecondary']!,
      onSurface: lightColors['onSurface']!,
      onSurfaceVariant: lightColors['onSurfaceVariant']!,
      outline: lightColors['outline']!,
      outlineVariant: lightColors['outlineVariant']!,
      shadow: lightColors['shadow']!,
    ),
    splashColor: lightColors['primary']!.withOpacity(0.03),
    hoverColor: lightColors['primary']!.withOpacity(0.03),
    highlightColor: lightColors['primary']!.withOpacity(0.05),
    scaffoldBackgroundColor: lightColors['surfaceContainer'],
    cardTheme: CardTheme(
      elevation: _cardElevation,
      shape: _cardShape,
      color: lightColors['surface'],
    ),
    appBarTheme: AppBarTheme(
      elevation: _cardElevation,
      titleTextStyle: _textTheme.titleLarge,
    ),
    textTheme: _textTheme.copyWith(
      bodySmall: _textTheme.bodySmall?.copyWith(
        color: lightColors['onSurfaceVariant'],
      ),
    ),
    // 底部导航栏主题
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: lightColors['surface'],
      height: _navigationBarHeight,
      elevation: _navigationBarElevation,
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: _baseTextStyle.fontFamily,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: darkColors['primary']!,
      primary: darkColors['primary']!,
      secondary: darkColors['secondary']!,
      surface: darkColors['surface']!,
      surfaceTint: darkColors['surfaceTint']!,
      surfaceContainerHighest: darkColors['surfaceVariant']!,
      onPrimary: darkColors['onPrimary']!,
      onSecondary: darkColors['onSecondary']!,
      onSurface: darkColors['onSurface']!,
      onSurfaceVariant: darkColors['onSurfaceVariant']!,
      outline: darkColors['outline']!,
      outlineVariant: darkColors['outlineVariant']!,
      shadow: darkColors['shadow']!,
    ),
    splashColor: darkColors['primary']!.withOpacity(0.03),
    hoverColor: darkColors['primary']!.withOpacity(0.03),
    highlightColor: darkColors['primary']!.withOpacity(0.05),
    scaffoldBackgroundColor: darkColors['surfaceContainer'],
    cardTheme: CardTheme(
      elevation: _cardElevation,
      shape: _cardShape,
      color: darkColors['surface'],
    ),
    appBarTheme: AppBarTheme(
      elevation: _cardElevation,
      titleTextStyle: _textTheme.titleLarge,
    ),
    textTheme: _textTheme.copyWith(
      bodySmall: _textTheme.bodySmall?.copyWith(
        color: darkColors['onSurfaceVariant'],
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: darkColors['surface'],
      height: _navigationBarHeight,
      elevation: _navigationBarElevation,
    ),
  );
}
