import 'package:topnews/features/news/data/datasource/mock/quill_delta_sample.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

class MockNewsDetailDataSource {
  static final MockNewsDetailDataSource _instance =
      MockNewsDetailDataSource._internal();

  factory MockNewsDetailDataSource() {
    return _instance;
  }

  MockNewsDetailDataSource._internal() {
    _init();
  }

  void _init() {
    // 初始化数据
  }

  Future<NewsEntity> getNewsDetail(String newsId) async {
    return Future.value(NewsEntity(
      id: newsId,
      title: 'Mock News Title',
      content: kQuillDefaultSampleJson,
      publishedAt: DateTime.now(),
      author: 'Mock Author',
      imageUrl:
          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
    ));
  }
}
