import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/widgets/app_card.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/presentation/widget/news_image.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({
    super.key,
    required this.news,
    this.onTap,
  });

  final NewsEntity news;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      margin: EdgeInsets.symmetric(
        horizontal: AppTheme.spacing['md']!,
        vertical: AppTheme.spacing['sm']!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (news.imageUrl != null)
            NewsImage(
              imageUrl: news.imageUrl,
              width: double.infinity,
              height: 200,
            ),
          SizedBox(height: AppTheme.spacing['md']),
          Text(
            news.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: AppTheme.spacing['xs']),
          Text(
            news.content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
