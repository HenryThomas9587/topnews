import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/news/data/repository/news_repository_provider.dart';
import 'package:topnews/features/news/domain/entity/news_draft_entity.dart';

part 'news_publish_detail_provider.g.dart';

@riverpod
Future<NewsDraftEntity?> newsPublishDetail(
  Ref ref,
  String id,
) async {
  final draft = await ref.read(newsPublishRepositoryProvider).getDraft(id);
  return draft;
}
