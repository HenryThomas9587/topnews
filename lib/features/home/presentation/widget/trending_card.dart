import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/utils/date_formatter.dart';
import 'package:topnews/features/home/domain/entity/trending_news_entity.dart';
import 'package:go_router/go_router.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
    required this.item,
  });

  final TrendingNewsEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: () => context.push('/news/${item.id}'),
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.03),
        borderRadius: BorderRadius.circular(
            (AppTheme.cardStyle['borderRadius'] as num).toDouble()),
        child: SizedBox(
          width: 300,
          height: 340,
          child: Column(
            children: [
              // 图片区域
              AspectRatio(
                aspectRatio: 2.2,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: AppTheme.cardStyle['imageBorderRadius'],
                      child: Image.network(
                        item.imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                          child: Icon(
                            Icons.error_outline,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                    // 分类标签
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppTheme.spacing['md']!,
                          vertical: AppTheme.spacing['xs']!,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.9),
                          borderRadius: BorderRadius.circular(
                              (AppTheme.cardStyle['categoryRadius'] as num)
                                  .toDouble()),
                        ),
                        child: Text(
                          item.category,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 内容区域
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppTheme.spacing['md']!,
                  vertical: AppTheme.spacing['sm']!,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 标题
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            height: 1.1,
                            fontSize: 15,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppTheme.spacing['xs']!),

                    // 副标题
                    Text(
                      item.subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            height: 1.1,
                            fontSize: 12,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppTheme.spacing['sm']!),

                    // 底部作者信息
                    Row(
                      children: [
                        CircleAvatar(
                          radius: (AppTheme.cardStyle['avatarRadius'] as num)
                              .toDouble(),
                          backgroundImage: NetworkImage(item.authorAvatar),
                        ),
                        SizedBox(width: AppTheme.spacing['xs']!),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item.author,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      height: 1.1,
                                      fontSize: 12,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                DateFormatter.timeAgo(item.publishedAt),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                      height: 1.1,
                                      fontSize: 11,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
