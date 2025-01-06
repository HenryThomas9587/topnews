import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/news/presentation/provider/category_provider.dart';
import 'package:topnews/features/news/presentation/widget/category_list.dart';

class CategoryListSection extends StatelessWidget {
  const CategoryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final categoriesAsync = ref.watch(categoriesProvider);
        final selectedId = ref.watch(selectedCategoryProvider);

        return categoriesAsync.when(
          data: (categories) => CategoryList(
            categories: categories,
            selectedId: selectedId,
            onCategorySelected: (id) {
              ref.read(selectedCategoryProvider.notifier).select(id);
            },
          ),
          loading: () => const SizedBox(
            height: 40,
            child: Center(child: LoadingIndicator()),
          ),
          error: (error, _) => const SizedBox.shrink(),
        );
      },
    );
  }
}
