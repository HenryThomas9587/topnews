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
  // 固定尺寸常量 - 考虑是否真的需要全部固定
  static const double width = 280.0;
  static const double height = 300; // 增加总高度
  static const double imageHeight = 157; // 16:9 ratio of width
  static const double titleHeight = 48.0;
  static const double authorInfoHeight = 20.0;
  static const double actionBarHeight = 20.0;
  static const _contentPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  final NewsEntity item;

  const StoryCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () => context.pushNewsDetail(item.id),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 默认左对齐
            children: [
              // 图片部分
              SizedBox(
                height: imageHeight,
                child: _CoverImage(
                  imageUrl: item.cover,
                  category: item.category,
                ),
              ),
              Padding(
                padding: _contentPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 标题
                    SizedBox(
                      height: titleHeight,
                      child: _StoryTitle(title: item.title),
                    ),
                    AppTheme.vSpaceSm,
                    // 作者信息
                    SizedBox(
                      height: authorInfoHeight,
                      child: _AuthorInfo(
                        avatar: item.authorAvatar,
                        author: item.author,
                        publishedAt: item.publishedAt,
                      ),
                    ),
                    AppTheme.vSpaceSm,
                    // 操作栏
                    NewsActionBar(
                      views: item.views,
                      comments: item.comments,
                      onShare: () {},
                      onBookmark: () {},
                      onMore: () {},
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

class _CoverImage extends StatelessWidget {
  final String imageUrl;
  final String category;

  const _CoverImage({
    required this.imageUrl,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          width: StoryCard.width,
          height: StoryCard.imageHeight,
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (_, __) => const _ImagePlaceholder(),
          errorWidget: (_, __, ___) => const _ImageError(),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: AppLabel(text: category),
        ),
      ],
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.surfaceContainerHighest,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}

class _ImageError extends StatelessWidget {
  const _ImageError();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.image_not_supported_outlined,
        color: theme.colorScheme.outline,
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final String avatar;
  final String author;
  final DateTime publishedAt;

  const _AuthorInfo({
    required this.avatar,
    required this.author,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodySmall;
    final secondaryStyle = textStyle?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    return Row(
      children: [
        UserAvatar(
          imageUrl: avatar,
          radius: 8,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  author,
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(' • ', style: secondaryStyle),
              Text(
                DateFormatter.timeAgo(publishedAt),
                style: secondaryStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StoryTitle extends StatelessWidget {
  final String title;

  const _StoryTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
