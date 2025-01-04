import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/home/domain/repository/story_repository.dart';
import 'package:topnews/features/home/data/repository/story_repository_impl.dart';
import 'package:topnews/features/home/data/datasource/story_remote_data_source_impl.dart';
import 'package:topnews/features/home/data/datasource/story_local_data_source_provider.dart';

final storyRepositoryProvider = Provider<StoryRepository>((ref) {
  final localDataSource = ref.watch(storyLocalDataSourceProvider);
  return StoryRepositoryImpl(
    remoteDataSource: StoryRemoteDataSourceImpl(),
    localDataSource: localDataSource,
  );
});
