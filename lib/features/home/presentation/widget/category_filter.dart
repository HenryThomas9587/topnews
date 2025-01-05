import 'package:flutter/material.dart';
import 'package:topnews/core/widget/horizontal_chip_list.dart';
import 'package:topnews/core/widget/base_section.dart';

class CategoryFilter extends StatelessWidget {
  final String title;
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String>? onCategorySelected;
  final VoidCallback? onViewAll;

  const CategoryFilter({
    super.key,
    required this.title,
    required this.categories,
    this.selectedCategory,
    this.onCategorySelected,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final items = categories
        .map((category) => ChipItem(
              id: category,
              label: category,
            ))
        .toList();

    return BaseSection(
      title: title,
      onViewAll: onViewAll,
      child: HorizontalChipList(
        items: items,
        selectedId: selectedCategory,
        onSelected: (item) => onCategorySelected?.call(item.id),
      ),
    );
  }
}
