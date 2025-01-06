import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsDetailPage extends HookConsumerWidget {
  const NewsDetailPage({
    super.key,
    required this.newsId,
  });

  final String newsId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: Center(
        child: Text('News Detail Page: $newsId'),
      ),
    );
  }
}
