import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/data/repository/author_repository_impl.dart';
import 'package:topnews/features/discover/domain/entity/author_entity.dart';

part 'follow_provider.g.dart';

@riverpod
class FollowNotify extends _$FollowNotify {
  @override
  Future<bool> build(AuthorEntity author) async {
    return Future.value(author.isFollowing);
  }

  toggleFollow(AuthorEntity author) async {
    try {
      final isFollowing = state.valueOrNull ?? false;
      state = const AsyncLoading();
      await ref
          .read(authorRepositoryProvider)
          .toggleFollow(author.id, isFollowing);
      state = AsyncData(!isFollowing);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
