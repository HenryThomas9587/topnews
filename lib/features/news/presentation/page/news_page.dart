import 'package:flutter/material.dart';
import 'package:topnews/features/news/presentation/widget/news_list_section.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const NewsListSection(categoryId: 0),
    );
  }
}
