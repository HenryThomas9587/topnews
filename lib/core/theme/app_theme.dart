import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 添加间距定义
  static const spacing = {
    'xs': 4.0,
    'sm': 8.0,
    'md': 16.0,
    'lg': 24.0,
    'xl': 32.0,
  };

  // 浅色主题颜色定义
  static const lightColors = {
    'primary': Color(0xFF4CD964),
    'secondary': Color.fromARGB(255, 26, 167, 49),
    'surface': Colors.white,
    'surfaceContainer': Colors.white,
    'surfaceVariant': Color(0xFFF2F2F7),
    'onPrimary': Colors.white,
    'onSecondary': Colors.white,
    'onSurface': Color(0xFF000000),
    'onSurfaceVariant': Color(0xFF8E8E93),
    'outline': Color(0xFFD1D1D6),
    'outlineVariant': Color(0xFFD9D9D9),
  };

  // 深色主题颜色定义
  static const darkColors = {
    'primary': Color(0xFF4CD964),
    'secondary': Color.fromARGB(255, 26, 167, 49),
    'surface': Color(0xFF121212),
    'surfaceContainer': Color(0xFF212121),
    'surfaceVariant': Color(0xFF303030),
    'onPrimary': Colors.white,
    'onSecondary': Colors.white,
    'onSurface': Colors.white,
    'onSurfaceVariant': Color(0xFFA1A1A1),
    'outline': Color(0xFF444444),
    'outlineVariant': Color(0xFF595959),
  };

  // 添加卡片样式常量
  static final cardStyle = <String, dynamic>{
    'elevation': 1.0,
    'borderRadius': 12.0,
    'imageRadius': 12.0,
    'imageBorderRadius': const BorderRadius.vertical(top: Radius.circular(12)),
    'categoryRadius': 20.0,
    'avatarRadius': 10.0,
  };

  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: lightColors['primary']!,
      primary: lightColors['primary']!,
      secondary: lightColors['secondary']!,
      surface: lightColors['surface']!,
      surfaceTint: lightColors['surfaceContainer']!,
      surfaceContainerHighest: lightColors['surfaceVariant']!,
      onPrimary: lightColors['onPrimary']!,
      onSecondary: lightColors['onSecondary']!,
      onSurface: lightColors['onSurface']!,
      onSurfaceVariant: lightColors['onSurfaceVariant']!,
      outline: lightColors['outline']!,
      outlineVariant: lightColors['outlineVariant']!,
    ),
    scaffoldBackgroundColor: lightColors['surfaceContainer']!,
    cardTheme: CardTheme(
      elevation: cardStyle['elevation'],
      shadowColor: Colors.black.withOpacity(0.1),
      surfaceTintColor: Colors.transparent,
      color: lightColors['surface']!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardStyle['borderRadius']!),
      ),
      margin: EdgeInsets.zero,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightColors['surface']!,
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: lightColors['onSurface']!,
      ),
      iconTheme: IconThemeData(color: lightColors['onSurface']!),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: lightColors['onSurface']!,
        height: 1.3,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: lightColors['onSurface']!,
        height: 1.3,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 15,
        color: lightColors['onSurfaceVariant']!,
        height: 1.4,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 13,
        color: lightColors['onSurfaceVariant']!,
        height: 1.4,
      ),
    ),
    // 底部导航栏主题
    navigationBarTheme: NavigationBarThemeData(
      height: 64,
      backgroundColor: lightColors['surface']!,
      indicatorColor: lightColors['primary']!.withOpacity(0.12),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: lightColors['primary']!,
          );
        }
        return GoogleFonts.inter(
          fontSize: 12,
          color: lightColors['onSurfaceVariant']!,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            size: 24,
            color: lightColors['primary']!,
          );
        }
        return IconThemeData(
          size: 24,
          color: lightColors['onSurfaceVariant']!,
        );
      }),
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: darkColors['primary']!,
      primary: darkColors['primary']!,
      secondary: darkColors['secondary']!,
      surface: darkColors['surface']!,
      surfaceTint: darkColors['surfaceContainer']!,
      surfaceContainerHighest: darkColors['surfaceVariant']!,
      onPrimary: darkColors['onPrimary']!,
      onSecondary: darkColors['onSecondary']!,
      onSurface: darkColors['onSurface']!,
      onSurfaceVariant: darkColors['onSurfaceVariant']!,
      outline: darkColors['outline']!,
      outlineVariant: darkColors['outlineVariant']!,
    ),
    scaffoldBackgroundColor: darkColors['surfaceContainer']!,
    cardTheme: CardTheme(
      elevation: cardStyle['elevation'],
      shadowColor: Colors.black.withOpacity(0.2),
      surfaceTintColor: Colors.transparent,
      color: darkColors['surface']!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardStyle['borderRadius']!),
      ),
      margin: EdgeInsets.zero,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkColors['surface']!,
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: darkColors['onSurface']!,
      ),
      iconTheme: IconThemeData(color: darkColors['onSurface']!),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: darkColors['onSurface']!,
        height: 1.3,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: darkColors['onSurface']!,
        height: 1.3,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 15,
        color: darkColors['onSurfaceVariant']!,
        height: 1.4,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 13,
        color: darkColors['onSurfaceVariant']!,
        height: 1.4,
      ),
    ),
    // 深色主题底部导航栏
    navigationBarTheme: NavigationBarThemeData(
      height: 64,
      backgroundColor: darkColors['surface']!,
      indicatorColor: darkColors['primary']!.withOpacity(0.12),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: darkColors['primary']!,
          );
        }
        return GoogleFonts.inter(
          fontSize: 12,
          color: darkColors['onSurfaceVariant']!,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            size: 24,
            color: darkColors['primary']!,
          );
        }
        return IconThemeData(
          size: 24,
          color: darkColors['onSurfaceVariant']!,
        );
      }),
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
