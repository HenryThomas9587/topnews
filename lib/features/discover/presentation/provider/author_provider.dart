import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/discover/data/repository/discover_repository_impl.dart';
import 'package:topnews/features/discover/domain/entity/author_entity.dart';

part 'author_provider.g.dart';

@riverpod
class AuthorNotifier extends _$AuthorNotifier {
  @override
  Future<List<AuthorEntity>> build() => _fetchAuthors();

  Future<List<AuthorEntity>> _fetchAuthors() async {
    logDebug('AuthorNotifier _fetchAuthors');
    final repository = ref.read(discoverRepositoryProvider);
    return repository.getAuthors();
  }

  Future<void> toggleFollow(String authorId) async {
    final repository = ref.read(discoverRepositoryProvider);
    final authors = state.valueOrNull;
    if (authors == null) return;

    final authorIndex = authors.indexWhere((a) => a.id == authorId);
    if (authorIndex == -1) return;

    final author = authors[authorIndex];
    try {
      if (author.isFollowing) {
        await repository.unfollowAuthor(authorId);
      } else {
        await repository.followAuthor(authorId);
      }

      // 只更新被修改的作者的状态
      final updatedAuthors = List<AuthorEntity>.from(authors);
      updatedAuthors[authorIndex] = author.copyWith(
        isFollowing: !author.isFollowing,
      );

      state = AsyncValue.data(updatedAuthors);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_fetchAuthors);
  }
}
