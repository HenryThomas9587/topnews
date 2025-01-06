import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsSearchPage extends ConsumerWidget {
  const NewsSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '搜索新闻...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            // TODO: 搜索新闻
          },
        ),
      ),
      body: const Center(
        child: Text('搜索功能开发中...'),
      ),
    );
  }
}
