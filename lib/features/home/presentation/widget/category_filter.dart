import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/features/home/presentation/widget/base_section.dart';

class CategoryFilter extends StatelessWidget {
  final String? title;
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String>? onCategorySelected;
  final VoidCallback? onViewAll;

  const CategoryFilter({
    super.key,
    this.title,
    required this.categories,
    this.selectedCategory,
    this.onCategorySelected,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSection(
      title: title ?? 'Category',
      onViewAll: onViewAll,
      child: _CategoryList(
        categories: categories,
        selectedCategory: selectedCategory,
        onCategorySelected: onCategorySelected,
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String>? onCategorySelected;

  const _CategoryList({
    required this.categories,
    this.selectedCategory,
    this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppTheme.spaceXs),
        itemBuilder: (context, index) => _CategoryChip(
          category: categories[index],
          isSelected: categories[index] == selectedCategory,
          onSelected: onCategorySelected,
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String category;
  final bool isSelected;
  final ValueChanged<String>? onSelected;

  const _CategoryChip({
    required this.category,
    required this.isSelected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FilterChip(
      label: Text(category),
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
      onSelected: (_) => onSelected?.call(category),
    );
  }
}
