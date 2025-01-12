import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/discover/data/repository/author_repository_impl.dart';
import 'package:topnews/features/discover/domain/entity/author_entity.dart';

mixin AuthorBaseNotifier<T>
    on AutoDisposeFamilyAsyncNotifier<List<AuthorEntity>, T> {
  bool getFollowState(String authorId) {
    return state.valueOrNull?.firstWhere((a) => a.id == authorId).isFollowing ??
        false;
  }

  Future<bool> toggleFollow(String authorId) async {
    final authors = state.value;
    if (authors == null) return false;
    final authorRepository = ref.read(authorRepositoryProvider);

    try {
      final author = authors.firstWhere((a) => a.id == authorId);
      await authorRepository.toggleFollow(authorId, author.isFollowing);

      // 更新状态
      updateFollowState(authors, authorId, author.isFollowing);
      return true;
    } catch (e) {
      logError('Failed to toggle follow: $e');
      return false;
    }
  }

  void updateFollowState(
      List<AuthorEntity> authors, String authorId, bool currentFollowState) {
    state = AsyncValue.data(authors.map((a) {
      if (a.id == authorId) {
        return a.copyWith(isFollowing: !currentFollowState);
      }
      return a;
    }).toList());
  }
}
