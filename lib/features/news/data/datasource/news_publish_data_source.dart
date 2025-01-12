import 'package:topnews/features/news/data/model/news_draft_model.dart';

abstract class NewsPublishDataSource {
  Future<NewsDraftModel?> getDraft(String id);
  Future<bool> publishNews(NewsDraftModel news);
  Future<bool> saveDraft(NewsDraftModel draft);
  Future<List<NewsDraftModel>> getDrafts();
  Future<bool> deleteDraft(String id);
  Future<bool> updateDraft(NewsDraftModel draft);
}
