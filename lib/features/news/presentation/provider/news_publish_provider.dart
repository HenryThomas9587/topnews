import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/data/repository/news_repository_provider.dart';
import 'package:topnews/features/news/domain/entity/news_draft_entity.dart';

part 'news_publish_provider.g.dart';

@riverpod
class NewsPublishNotifier extends _$NewsPublishNotifier {
  String? draftId;

  @override
  Future<void> build() async {
    return;
  }

  Future<bool> publishNews(NewsDraftEntity news) async {
    state = const AsyncLoading();
    try {
      return await ref.read(newsPublishRepositoryProvider).publishNews(news);
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  Future<bool> saveDraft(NewsDraftEntity draft) async {
    state = const AsyncLoading();
    try {
      draftId = draft.id;
      return await ref.read(newsPublishRepositoryProvider).saveDraft(draft);
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  Future<bool> updateDraft(NewsDraftEntity draft) async {
    state = const AsyncLoading();
    try {
      return await ref.read(newsPublishRepositoryProvider).updateDraft(draft);
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  Future<List<NewsDraftEntity>> getDrafts() async {
    state = const AsyncLoading();
    try {
      return await ref.read(newsPublishRepositoryProvider).getDrafts();
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }

  Future<bool> deleteDraft(String id) async {
    state = const AsyncLoading();
    try {
      return await ref.read(newsPublishRepositoryProvider).deleteDraft(id);
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}
