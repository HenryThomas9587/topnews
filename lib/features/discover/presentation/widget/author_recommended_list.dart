import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/core/widget/base_section.dart';
import 'package:topnews/core/widget/common_widgets.dart';
import 'package:topnews/features/discover/config/author_type.dart';
import 'package:topnews/features/discover/config/user_type.dart';
import 'package:topnews/features/discover/domain/entity/author_entity.dart';
import 'package:topnews/features/discover/presentation/provider/author_page_provider.dart';
import 'package:topnews/features/discover/presentation/widget/author_column_item.dart';

class AuthorRecommendedList extends HookConsumerWidget {
  const AuthorRecommendedList({super.key, required this.userType});

  final UserType userType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authorParam = useMemoized(
        () => AuthorParam(AuthorType.recommended, userType, ''), [userType]);
    final authorData = ref.watch(
        authorPageNotifierProvider(authorParam).select((state) => state.data));
    final notifier = ref.read(authorPageNotifierProvider(authorParam).notifier);
    // 打印渲染
    logDebug("AuthorRecommendedList build:$hashCode");
    return BaseSection(
      title: userType.label,
      onViewAll: () {
        // TODO: Navigate to authors page
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.refresh(),
            tooltip: '刷新',
          ),
          TextButton(
            onPressed: () => notifier.loadFirstPage(),
            child: const Text('换一批'),
          ),
        ],
      ),
      child: SizedBox(
        height: 140,
        width: double.infinity, // 添加宽度约束
        child: authorData.when(
          data: (authors) => _buildAuthorList(authors),
          loading: () => const Center(child: LoadingIndicator()),
          error: (error, stack) => ErrorView(
            error: error,
            onRetry: () => notifier.refresh(),
          ),
        ),
      ),
    );
  }

  Widget _buildAuthorList(List<AuthorEntity> authors) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      physics: const BouncingScrollPhysics(),
      itemCount: authors.length,
      separatorBuilder: (_, __) => const SizedBox(width: AppTheme.spaceSm),
      itemBuilder: (context, index) => AuthorColumnItem(
        key: Key(authors[index].id.toString()),
        author: authors[index],
      ),
    );
  }
}
