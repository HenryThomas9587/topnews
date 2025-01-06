import 'package:flutter/material.dart';

class ChipItem {
  final int id;
  final String label;
  final dynamic data;

  const ChipItem({
    required this.id,
    required this.label,
    this.data,
  });
}

class HorizontalChipList extends StatelessWidget {
  final List<ChipItem> items;
  final int? selectedId;
  final ValueChanged<ChipItem>? onSelected;
  final double height;
  final double spacing;
  final EdgeInsets padding;

  const HorizontalChipList({
    super.key,
    required this.items,
    this.selectedId,
    this.onSelected,
    this.height = 48,
    this.spacing = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(width: spacing),
        itemBuilder: (context, index) => _ChipItem(
          item: items[index],
          isSelected: items[index].id == selectedId,
          onSelected: onSelected,
        ),
      ),
    );
  }
}

class _ChipItem extends StatelessWidget {
  final ChipItem item;
  final bool isSelected;
  final ValueChanged<ChipItem>? onSelected;

  const _ChipItem({
    required this.item,
    required this.isSelected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FilterChip(
      label: Text(item.label),
      selected: isSelected,
      showCheckmark: false,
      labelStyle: TextStyle(
        color: isSelected
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onSurface,
      ),
      backgroundColor: theme.colorScheme.surface,
      selectedColor: theme.colorScheme.primary,
      side: BorderSide(
        color: isSelected ? Colors.transparent : theme.colorScheme.outline,
      ),
      onSelected: (_) => onSelected?.call(item),
    );
  }
}
