import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/provider/paged_notifier.dart';
import 'package:topnews/core/provider/paged_state.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/discover/config/tag_type.dart';
import 'package:topnews/features/discover/data/repository/tag_repository_impl.dart';
import 'package:topnews/features/discover/domain/entity/tag_entity.dart';

class TagParam {
  final TagType type;
  final String query;

  TagParam(this.type, this.query);
}

final tagPageNotifierProvider = AutoDisposeNotifierProviderFamily<
    TagPageNotifier, PagedState<TagEntity>, TagParam>(
  TagPageNotifier.new,
);

class TagPageNotifier
    extends AutoDisposeFamilyNotifier<PagedState<TagEntity>, TagParam>
    with PagedFamilyNotifier<TagEntity, TagParam> {
  @override
  Future<List<TagEntity>> fetchPage(int page, int pageSize) async {
    return _switchType(page, pageSize, arg.type);
  }

  // switch type
  Future<List<TagEntity>> _switchType(
      int page, int pageSize, TagType type) async {
    final repository = ref.read(tagRepositoryProvider);
    final TagType tagType = arg.type;
    logDebug("TagPageNotifier-$hashCode:"
        ",type: $tagType"
        ",page: $page"
        ",pageSize: $pageSize");
    // 根据 type 切换查询条件
    switch (tagType) {
      case TagType.trending:
        return repository.getTrendingTags(page, pageSize);
      case TagType.latest:
        return repository.getLatestTags(page, pageSize);
      case TagType.recommended:
        return repository.getRecommendedTags(page, pageSize);
      case TagType.search:
        return repository.searchTags(page, pageSize, arg.query);
      case TagType.follow:
        return repository.getFollowedTags(page, pageSize);
      case TagType.category:
        return repository.getCategoryTags(page, pageSize, arg.query);
    }
  }

  @override
  void updateScrollOffset(double offset) {
    state = state.copyWith(scrollOffset: offset);
  }
}
