import 'package:topnews/features/news/data/datasource/news_publish_data_source.dart';
import 'package:topnews/features/news/data/model/news_draft_model.dart';

class NewsPublishRemoteDataSourceImpl implements NewsPublishDataSource {
  @override
  Future<NewsDraftModel?> getDraft(String id) async {
    return Future.delayed(const Duration(seconds: 1), () => null);
  }

  @override
  Future<bool> publishNews(NewsDraftModel news) async {
    // TODO: 实现发布逻辑
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future<bool> saveDraft(NewsDraftModel draft) async {
    // TODO: 实现保存草稿逻辑
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> updateDraft(NewsDraftModel draft) async {
    // TODO: 实现更新草稿逻辑
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<List<NewsDraftModel>> getDrafts() async {
    // TODO: 实现获取草稿列表逻辑
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  @override
  Future<bool> deleteDraft(String id) async {
    // TODO: 实现删除草稿逻辑
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
