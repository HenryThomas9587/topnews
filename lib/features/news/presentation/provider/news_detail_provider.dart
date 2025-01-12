import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/news/data/repository/news_repository_provider.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

part 'news_detail_provider.g.dart';

@riverpod
Future<NewsEntity?> newsDetail(
  Ref ref,
  String id,
) async {
  final draft = await ref.read(newsRepositoryProvider).getNewsDetail(id);
  return draft;
}

@riverpod
Future<Document> getDoc(
  Ref ref,
  String id,
) async {
  try {
    NewsEntity? news = await newsDetail(ref, id);
    return Document.fromJson(jsonDecode(news?.content ?? ''));
  } catch (e) {
    logError("getDoc error: ${e.toString()}");
    return Document();
  }
}
