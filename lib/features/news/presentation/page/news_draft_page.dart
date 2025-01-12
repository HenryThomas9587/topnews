import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/features/news/presentation/provider/news_publish_detail_provider.dart';

class NewsDraftPreviewPage extends ConsumerWidget {
  const NewsDraftPreviewPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(newsPublishDetailProvider(id));
    return Scaffold(
      appBar: AppBar(
        title: const Text('草稿预览'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: draft.when(
          data: (draft) {
            if (draft == null) {
              return const Center(child: Text('未找到草稿'));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  draft.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8.0),
                Text(
                  '分类: ${draft.category}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16.0),
                Text(
                  draft.content,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16.0),
                if (draft.images.isNotEmpty)
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: draft.images.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.file(
                          File(draft.images[index]),
                          height: 92,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('错误: $error')),
        ),
      ),
    );
  }
}
