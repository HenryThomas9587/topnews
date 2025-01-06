import 'package:flutter/material.dart';
import 'package:topnews/core/widget/horizontal_chip_list.dart';
import 'package:topnews/core/widget/base_section.dart';
import 'package:topnews/features/news/domain/entity/category_entity.dart';
import 'package:topnews/features/news/presentation/widget/category_list.dart';

class CategoryFilter extends StatelessWidget {
  final String title;
  final List<CategoryEntity> categories;
  final int? selectedCategory;
  final ValueChanged<int>? onCategorySelected;
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
    categories
        .map((category) => ChipItem(
              id: category.id,
              label: category.name,
            ))
        .toList();

    return BaseSection(
      title: title,
      onViewAll: onViewAll,
      child: CategoryList(
        categories: categories,
        selectedId: selectedCategory,
        onCategorySelected: (id) {
          onCategorySelected?.call(id);
        },
      ),
    );
  }
}
