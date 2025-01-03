import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/data/repository/news_repository_impl.dart';

part 'news_detail_provider.g.dart';

@riverpod
Future<NewsEntity> newsDetail(Ref ref, String newsId) async {
  final repository = ref.read(newsRepositoryProvider);
  return repository.getNewsDetail(newsId);
}
