import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.isChecked,
    required this.onTap,
    required this.text,
    required this.checkedText,
  });

  final bool isChecked;
  final VoidCallback onTap;
  final String text;
  final String checkedText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: AppTheme.boxBorderRadius,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spaceSm,
          vertical: AppTheme.spaceXs,
        ),
        decoration: BoxDecoration(
          color: isChecked ? Colors.transparent : theme.colorScheme.primary,
          border: Border.all(color: theme.colorScheme.primary),
          borderRadius: AppTheme.boxBorderRadius,
        ),
        child: Text(
          isChecked ? checkedText : text,
          style: theme.textTheme.labelMedium?.copyWith(
            color: isChecked
                ? theme.colorScheme.primary
                : theme.colorScheme.onPrimary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
