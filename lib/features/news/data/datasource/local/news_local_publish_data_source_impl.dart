import 'package:hive/hive.dart';
import 'package:topnews/features/news/data/datasource/news_publish_data_source.dart';
import 'package:topnews/features/news/data/model/news_draft_model.dart';

class NewsPublishLocalDataSourceImpl implements NewsPublishDataSource {
  final Box<NewsDraftModel> _box;

  NewsPublishLocalDataSourceImpl(this._box);

  @override
  Future<NewsDraftModel?> getDraft(String id) async {
    return _box.get(id);
  }

  @override
  Future<bool> publishNews(NewsDraftModel news) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future<bool> saveDraft(NewsDraftModel draft) async {
    await Future.delayed(const Duration(seconds: 1));
    _box.put(draft.id, draft);
    return true;
  }

  @override
  Future<bool> updateDraft(NewsDraftModel draft) async {
    await Future.delayed(const Duration(seconds: 1));
    _box.put(draft.id, draft);
    return true;
  }

  @override
  Future<List<NewsDraftModel>> getDrafts() async {
    return _box.values.toList();
  }

  @override
  Future<bool> deleteDraft(String id) async {
    _box.delete(id);
    return true;
  }
}
