import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/features/home/domain/entity/story_entity.dart';
import 'package:topnews/features/home/domain/repository/story_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/home/data/repository/story_repository_provider.dart';

part 'get_stories_usecase.g.dart';

class GetStoriesUseCase {
  final StoryRepository repository;

  GetStoriesUseCase(this.repository);

  Future<List<StoryEntity>> execute({int page = 1, int pageSize = 10}) {
    return repository.getStories(page: page, pageSize: pageSize);
  }
}

class RefreshStoriesUseCase {
  final StoryRepository repository;

  RefreshStoriesUseCase(this.repository);

  Future<void> execute() {
    return repository.refreshStories();
  }
}

@riverpod
GetStoriesUseCase getStoriesUseCase(Ref ref) {
  return GetStoriesUseCase(ref.watch(storyRepositoryProvider));
}

@riverpod
RefreshStoriesUseCase refreshStoriesUseCase(Ref ref) {
  return RefreshStoriesUseCase(ref.watch(storyRepositoryProvider));
}
