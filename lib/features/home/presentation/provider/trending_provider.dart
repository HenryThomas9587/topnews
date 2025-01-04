import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/home/data/repository/trending_repository_impl.dart';
import 'package:topnews/features/home/domain/entity/trending_news_entity.dart';

part 'trending_provider.g.dart';

@riverpod
Future<List<TrendingNewsEntity>> trendingNews(Ref ref) {
  return ref.watch(trendingRepositoryProvider).getTrendingNews();
}
