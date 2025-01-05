import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';

class UserAvatar extends StatelessWidget {
  final String? imageUrl;
  final double? radius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icon;

  const UserAvatar({
    super.key,
    this.imageUrl,
    this.radius,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const defaultRadius = AppTheme.avatarRadius;
    final avatarRadius = radius ?? defaultRadius;

    return CircleAvatar(
      radius: avatarRadius,
      backgroundColor: backgroundColor ?? theme.colorScheme.primaryContainer,
      foregroundColor: foregroundColor ?? theme.colorScheme.onSurface,
      backgroundImage: _getBackgroundImage(),
      onBackgroundImageError: (_, __) {},
      child: _shouldShowFallback()
          ? Icon(
              icon ?? Icons.person_outline,
              size: avatarRadius * 1.2,
            )
          : null,
    );
  }

  ImageProvider? _getBackgroundImage() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return NetworkImage(imageUrl!);
    }
    return null;
  }

  bool _shouldShowFallback() {
    return imageUrl == null || imageUrl!.isEmpty;
  }
}
