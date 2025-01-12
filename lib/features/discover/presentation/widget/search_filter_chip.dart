import 'package:flutter/material.dart';

class SearchFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const SearchFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelected(),
      backgroundColor: theme.colorScheme.surface,
      selectedColor: theme.colorScheme.primaryContainer,
      labelStyle: theme.textTheme.bodySmall?.copyWith(
        color: isSelected
            ? theme.colorScheme.primary
            : theme.colorScheme.onSurface,
      ),
    );
  }
}
