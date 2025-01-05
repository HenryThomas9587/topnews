import 'package:flutter/material.dart';
import 'package:topnews/features/home/domain/entity/trending_news_entity.dart';
import 'package:topnews/features/home/presentation/widget/base_section.dart';
import 'package:topnews/features/home/presentation/widget/trending_card.dart';

class TrendingSection extends StatelessWidget {
  final List<TrendingNewsEntity> items;
  final VoidCallback? onViewAll;

  const TrendingSection({
    super.key,
    required this.items,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSection(
      title: 'Trending',
      onViewAll: onViewAll,
      child: SizedBox(
        height: 240,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) => TrendingCard(item: items[index]),
        ),
      ),
    );
  }
}
