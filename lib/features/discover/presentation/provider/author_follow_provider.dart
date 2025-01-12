import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/data/repository/author_repository_impl.dart';

part 'author_follow_provider.g.dart';

@riverpod
class AuthorFollowNotifier extends _$AuthorFollowNotifier {
  @override
  Map<String, bool> build() => {};

  Future<bool> toggleFollow(String authorId, bool currentState) async {
    try {
      await ref
          .read(authorRepositoryProvider)
          .toggleFollow(authorId, currentState);
      state = {...state, authorId: !currentState};
      return true;
    } catch (e) {
      return false;
    }
  }

  bool getFollowState(String authorId, bool defaultValue) {
    return state[authorId] ?? defaultValue;
  }
}
