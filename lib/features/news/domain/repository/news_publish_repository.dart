import 'package:topnews/features/news/domain/entity/news_draft_entity.dart';

abstract class NewsPublishRepository {
  Future<NewsDraftEntity?> getDraft(String id);
  Future<bool> publishNews(NewsDraftEntity news);
  Future<bool> saveDraft(NewsDraftEntity draft);
  Future<bool> updateDraft(NewsDraftEntity draft);
  Future<bool> deleteDraft(String id);
  Future<List<NewsDraftEntity>> getDrafts();
}
