import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/features/home/data/datasource/story_data_source.dart';
import 'package:topnews/features/home/data/datasource/story_local_data_source_impl.dart';
import 'package:hive/hive.dart';

final storyLocalDataSourceProvider = StateProvider<StoryLocalDataSource>((ref) {
  final box = Hive.box<String>('stories');
  return StoryLocalDataSourceImpl(box);
});
