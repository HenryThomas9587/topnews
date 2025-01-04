import 'package:flutter/material.dart';
import 'package:topnews/core/utils/date_formatter.dart';
import 'package:topnews/features/home/domain/entity/story_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:topnews/core/theme/app_theme.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.story,
  });

  final StoryEntity story;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: AppTheme.spacing['md']!,
        vertical: AppTheme.spacing['sm']!,
      ),
      child: InkWell(
        onTap: () => context.push('/news/${story.id}'),
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.03),
        borderRadius:
            BorderRadius.circular(AppTheme.cardStyle['borderRadius']!),
        child: Padding(
          padding: EdgeInsets.all(AppTheme.spacing['md']!),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 头部作者信息
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(story.authorAvatar),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          story.author,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          DateFormatter.timeAgo(story.publishedAt),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 内容和图片区域 - 宽屏时横向布局
              if (isWideScreen)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            story.title,
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            story.content,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          story.imageUrl,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      story.content,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        story.imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 12),

              // 底部交互区
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _InteractionButton(
                          icon: Icons.remove_red_eye_outlined,
                          count: story.readTime,
                          label: 'min read',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _InteractionButton(
                        icon: Icons.thumb_up_outlined,
                        count: story.likes,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 16),
                      _InteractionButton(
                        icon: Icons.chat_bubble_outline,
                        count: story.comments,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: const Icon(Icons.share_outlined),
                        iconSize: 20,
                        visualDensity: VisualDensity.compact,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InteractionButton extends StatelessWidget {
  const _InteractionButton({
    required this.icon,
    required this.count,
    this.label,
    required this.onPressed,
  });

  final IconData icon;
  final int count;
  final String? label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            count.toString(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          if (label != null) ...[
            const SizedBox(width: 4),
            Text(
              label!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}
