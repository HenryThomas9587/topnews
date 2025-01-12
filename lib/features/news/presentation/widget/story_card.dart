import 'package:flutter/material.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/util/date_formatter.dart';
import 'package:topnews/core/widget/user_avatar.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/core/widget/app_label.dart';
import 'package:topnews/core/widget/news_action_bar.dart';
import 'package:cached_network_image/cached_network_image.dart'; // 假设您使用了 CachedNetworkImage

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.item,
  });

  final NewsEntity item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const cardPadding = EdgeInsets.all(AppTheme.spaceMd);

    return Card(
      clipBehavior: Clip.hardEdge, // Card 本身可以设置 clipBehavior
      child: InkWell(
        onTap: () => context.pushNewsDetail(item.id),
        child: SizedBox(
          width: AppTheme.storyCardWidth,
          height: AppTheme.storyCardHeight,
          child: Column(
            children: [
              // 图片部分 - 使用 Container 和 BoxDecoration
              SizedBox(
                height: AppTheme.storyCardImageHeight,
                width: double.infinity,
                child: Stack(
                  children: [
                    _buildCoverImage(),
                    Padding(
                      padding: cardPadding,
                      child: AppLabel(text: item.category),
                    ),
                  ],
                ),
              ),
              // 内容部分
              Padding(
                padding: AppTheme.storyCardPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: theme.textTheme.bodyLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoverImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.imageBorderTopRadius, // 应用圆角
        image: DecorationImage(
          image: CachedNetworkImageProvider(
              item.cover), // 使用 CachedNetworkImageProvider
          fit: BoxFit.cover,
        ),
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
              const Text(
                ' • ',
                style: TextStyle(
                    // ... theme.textTheme.bodyMedium 的属性
                    ),
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
