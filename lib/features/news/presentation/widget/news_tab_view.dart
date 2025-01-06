import 'package:flutter/material.dart';
import 'package:topnews/features/news/domain/entity/category_entity.dart';
import 'package:topnews/features/news/presentation/widget/news_list_section.dart';

class NewsTabView extends StatelessWidget {
  const NewsTabView({
    super.key,
    required this.tabs,
    required this.controller,
  });

  final List<CategoryEntity> tabs;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: tabs
          .map((category) => NewsListSection(
                categoryId: category.id,
              ))
          .toList(),
    );
  }
}
