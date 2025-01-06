import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/domain/entity/trending_news_entity.dart';
import 'package:topnews/features/news/domain/repository/trending_repository.dart';
import 'package:topnews/features/news/data/datasource/mock/mock_trending_data.dart';

part 'trending_repository_impl.g.dart';

@riverpod
TrendingRepository trendingRepository(Ref ref) {
  return TrendingRepositoryImpl();
}

class TrendingRepositoryImpl implements TrendingRepository {
  @override
  Future<List<TrendingNewsEntity>> getTrendingNews() async {
    // 模拟获取trending数据
    await Future.delayed(const Duration(seconds: 1));
    return mockTrendingNews;
  }
}
