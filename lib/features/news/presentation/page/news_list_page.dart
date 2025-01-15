import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/features/news/config/news_type.dart';
import 'package:topnews/features/news/presentation/widget/news_page_list.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({
    super.key,
    required this.type,
    this.query,
  });

  final String type;
  final String? query;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final newsType = NewsType.fromString(type);
    return Scaffold(
      appBar: AppBar(
        title: Text(newsType.label, style: theme.textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.spaceMd), // 使用主题中的间距常量
        child: NewsPageList(newsType: newsType, query: query),
      ),
    );
  }
}
