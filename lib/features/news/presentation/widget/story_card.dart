import 'package:flutter/material.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/util/date_formatter.dart';
import 'package:topnews/core/widget/image_error_placeholder.dart';
import 'package:topnews/core/widget/user_avatar.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/core/widget/app_label.dart';
import 'package:topnews/core/widget/news_action_bar.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.item,
  });

  final NewsEntity item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => context.pushNewsDetail(item.id),
        child: SizedBox(
          width: 280,
          child: Column(
            children: [
              // 图片部分 - 固定高度
              SizedBox(
                height: 140,
                width: double.infinity,
                child: Stack(
                  children: [
                    _buildCoverImage(),
                    Padding(
                      padding: const EdgeInsets.all(AppTheme.spaceMd),
                      child: AppLabel(text: item.category),
                    ),
                  ],
                ),
              ),
              // 内容部分 - 使用 Expanded 确保底部对齐
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 标题部分 - 使用 Expanded 自适应高度
                      Expanded(
                        child: Text(
                          item.title,
                          style: theme.textTheme.bodyLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // 底部信息 - 固定高度部分
                      const SizedBox(height: 8),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildAuthorInfo(theme),
                          const SizedBox(height: 4),
                          NewsActionBar(
                            views: item.views,
                            comments: item.comments,
                            onShare: () {},
                            onBookmark: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoverImage() {
    return ClipRRect(
      borderRadius: AppTheme.imageBorderTopRadius,
      child: Image.network(
        item.cover,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const ImageErrorPlaceholder(),
      ),
    );
  }

  Widget _buildAuthorInfo(ThemeData theme) {
    return Row(
      children: [
        UserAvatar(
          imageUrl: item.authorAvatar,
          radius: 8,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  item.author,
                  style: theme.textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                ' • ',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                DateFormatter.timeAgo(item.publishedAt),
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
