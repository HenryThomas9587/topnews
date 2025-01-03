import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/data/repository/news_repository_impl.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/domain/repository/news_repository.dart';

part 'get_news_list_usecase.g.dart';

class GetNewsListUseCase {
  const GetNewsListUseCase(this._repository);

  final NewsRepository _repository;

  Future<List<NewsEntity>> call() => _repository.getNewsList();
}

@riverpod
GetNewsListUseCase getNewsListUseCase(Ref ref) {
  final repository = ref.watch(newsRepositoryProvider);
  return GetNewsListUseCase(repository);
}
