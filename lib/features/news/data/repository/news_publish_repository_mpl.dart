import 'package:topnews/features/news/data/datasource/news_publish_data_source.dart';
import 'package:topnews/features/news/data/model/news_draft_model.dart';
import 'package:topnews/features/news/domain/entity/news_draft_entity.dart';
import 'package:topnews/features/news/domain/repository/news_publish_repository.dart';

class NewsPublishRepositoryImpl implements NewsPublishRepository {
  final NewsPublishDataSource _remoteDataSource;
  final NewsPublishDataSource _localDataSource;

  NewsPublishRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<NewsDraftEntity?> getDraft(String id) {
    return _localDataSource.getDraft(id).then((value) => value?.toEntity());
  }

  @override
  Future<bool> publishNews(NewsDraftEntity news) {
    return _remoteDataSource.publishNews(NewsDraftModel.fromEntity(news));
  }

  @override
  Future<bool> saveDraft(NewsDraftEntity draft) {
    return _localDataSource.saveDraft(NewsDraftModel.fromEntity(draft));
  }

  @override
  Future<bool> updateDraft(NewsDraftEntity draft) {
    return _localDataSource.updateDraft(NewsDraftModel.fromEntity(draft));
  }

  @override
  Future<List<NewsDraftEntity>> getDrafts() {
    return _localDataSource
        .getDrafts()
        .then((value) => value.map((e) => e.toEntity()).toList());
  }

  @override
  Future<bool> deleteDraft(String id) {
    return _localDataSource.deleteDraft(id);
  }
}
