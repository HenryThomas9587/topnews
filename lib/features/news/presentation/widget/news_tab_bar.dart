import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/features/news/domain/entity/category_entity.dart';

class NewsTabBar extends StatelessWidget implements PreferredSizeWidget {
  const NewsTabBar({
    super.key,
    required this.tabs,
    required this.controller,
  });

  final List<CategoryEntity> tabs;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: kToolbarHeight,
      margin: const EdgeInsets.symmetric(vertical: AppTheme.spaceSm),
      child: TabBar(
        controller: controller,
        isScrollable: true,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spaceMd),
        labelPadding: const EdgeInsets.symmetric(horizontal: AppTheme.spaceSm),
        indicator: const BoxDecoration(),
        dividerColor: Colors.transparent,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        tabAlignment: TabAlignment.start,
        tabs: tabs.map((tab) {
          return Tab(
            child: AnimatedBuilder(
              animation: controller.animation!,
              builder: (context, child) {
                final isSelected = controller.index == tabs.indexOf(tab);
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spaceMd,
                    vertical: AppTheme.spaceXs,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? Colors.transparent
                          : theme.colorScheme.outline,
                    ),
                  ),
                  child: Text(
                    tab.label,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: isSelected
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
