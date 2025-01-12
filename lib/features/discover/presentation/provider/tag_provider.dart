import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/data/repository/tag_repository_impl.dart';

part 'tag_provider.g.dart';

@riverpod
class TagNotifier extends _$TagNotifier {
  @override
  FutureOr<void> build() async {}

  Future<void> followTag(String tagId) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(tagRepositoryProvider);
      await repository.followTag(tagId);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> unfollowTag(String tagId) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(tagRepositoryProvider);
      await repository.unfollowTag(tagId);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
