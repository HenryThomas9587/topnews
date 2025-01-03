import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/features/news/data/model/comment_model.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/presentation/provider/news_detail_provider.dart';
import 'package:topnews/features/news/presentation/widget/news_image.dart';

class NewsDetailPage extends ConsumerWidget {
  const NewsDetailPage({
    super.key,
    required this.newsId,
  });

  final String newsId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsDetailAsync = ref.watch(newsDetailProvider(newsId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('新闻详情'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: newsDetailAsync.when(
        data: (news) => _buildDetail(context, news),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('加载失败: $error'),
        ),
      ),
    );
  }

  Widget _buildDetail(BuildContext context, NewsEntity news) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (news.imageUrl != null)
            NewsImage(
              imageUrl: news.imageUrl,
              width: double.infinity,
              height: 200,
            ),
          const SizedBox(height: 16),
          Text(
            news.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            news.content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (news.comments.isNotEmpty) ...[
            const SizedBox(height: 24),
            Text(
              '评论 (${news.comments.length})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...news.comments.map((comment) => _CommentItem(comment: comment)),
          ],
        ],
      ),
    );
  }
}

class _CommentItem extends StatelessWidget {
  const _CommentItem({required this.comment});

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          Text(
            comment.body,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            comment.email,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
