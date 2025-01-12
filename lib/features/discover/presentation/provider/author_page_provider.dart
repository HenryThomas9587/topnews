import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/provider/paged_notifier.dart';
import 'package:topnews/core/provider/paged_state.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/discover/config/author_type.dart';
import 'package:topnews/features/discover/config/user_type.dart';
import 'package:topnews/features/discover/data/repository/author_repository_impl.dart';
import 'package:topnews/features/discover/domain/entity/author_entity.dart';

class AuthorParam {
  final AuthorType type;
  final UserType userType;
  final String query;

  AuthorParam(this.type, this.userType, this.query);
}

final authorPageNotifierProvider = AutoDisposeNotifierProviderFamily<
    AuthorPageNotifier, PagedState<AuthorEntity>, AuthorParam>(
  AuthorPageNotifier.new,
);

class AuthorPageNotifier
    extends AutoDisposeFamilyNotifier<PagedState<AuthorEntity>, AuthorParam>
    with PagedFamilyNotifier<AuthorEntity, AuthorParam> {
  @override
  Future<List<AuthorEntity>> fetchPage(int page, int pageSize) async {
    return _switchType(page, pageSize, arg.type);
  }

  // switch type
  Future<List<AuthorEntity>> _switchType(
      int page, int pageSize, AuthorType type) async {
    final repository = ref.read(authorRepositoryProvider);
    final AuthorType authorType = arg.type;
    logDebug("AuthorPageNotifier-$hashCode:"
        ",type: $authorType"
        ",page: $page"
        ",pageSize: $pageSize");
    // 根据 type 切换查询条件
    switch (authorType) {
      case AuthorType.trending:
        return repository.getFollowedAuthors(page, pageSize);
      case AuthorType.latest:
        return repository.getLatestAuthors(page, pageSize);
      case AuthorType.recommended:
        return repository.getRecommendedAuthors(
            page, pageSize, arg.userType.name);
      case AuthorType.search:
        return repository.searchAuthors(page, pageSize, arg.query);
      case AuthorType.follow:
        return repository.getFollowedAuthors(page, pageSize);
      case AuthorType.category:
        return repository.getCategoryAuthors(page, pageSize, arg.query);
    }
  }

  @override
  void updateScrollOffset(double offset) {
    state = state.copyWith(scrollOffset: offset);
  }

  // 更新某个 item 的数据
  void updateItemState(AuthorEntity newItem) {
    final list = state.data.valueOrNull ?? [];
    // 遍历列表，找到需要更新的 item
    final updatedList = list.map((item) {
      if (item.id == newItem.id) {
        return newItem.copyWith(isFollowing: !newItem.isFollowing);
      }
      return item; // 保持其他 item 不变
    }).toList();
    state = state.copyWith(data: AsyncData(updatedList));
  }
}
