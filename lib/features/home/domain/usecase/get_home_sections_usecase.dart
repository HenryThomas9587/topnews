import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/home/domain/entity/home_section.dart';
import 'package:topnews/features/news/data/repository/category_repository_impl.dart';
import 'package:topnews/features/news/data/repository/news_repository_provider.dart';
import 'package:topnews/features/news/data/repository/trending_repository_impl.dart';
import 'package:topnews/features/news/domain/entity/category_entity.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/domain/entity/trending_news_entity.dart';
import 'package:topnews/features/news/domain/repository/news_repository.dart';
import 'package:topnews/features/news/domain/repository/trending_repository.dart';
import 'package:topnews/features/news/domain/repository/category_repository.dart';

part 'get_home_sections_usecase.g.dart';

class GetHomeSectionsUseCase {
  final NewsRepository newsRepository;
  final TrendingRepository trendingRepository;
  final CategoryRepository categoryRepository;

  GetHomeSectionsUseCase({
    required this.newsRepository,
    required this.trendingRepository,
    required this.categoryRepository,
  });

  Future<List<HomeSection>> execute({int page = 1, int pageSize = 10}) async {
    if (page == 1) {
      // 并行请求所有section数据
      final results = await Future.wait([
        trendingRepository.getTrendingNews(),
        categoryRepository.getCategories(),
        newsRepository.getNews(
          page: page,
          pageSize: pageSize,
        ),
      ]);

      final trending = results[0] as List<TrendingNewsEntity>;
      final categories = results[1] as List<CategoryEntity>;
      final news = results[2] as List<NewsEntity>;
      final sectionList = [
        HomeSection(
          type: HomeSectionType.trending,
          trendingNews: trending,
          title: 'Trending Now',
        ),
        HomeSection(
          type: HomeSectionType.category,
          title: 'Categories',
          categorys: categories,
        ),
      ];
      sectionList.addAll(news.map((story) => HomeSection(
            type: HomeSectionType.story,
            item: story,
          )));
      return sectionList;
    } else {
      // 后续页面只加载stories
      final stories = await newsRepository.getNews(
        page: page,
        pageSize: pageSize,
      );
      return stories
          .map((story) => HomeSection(
                type: HomeSectionType.story,
                item: story,
              ))
          .toList();
    }
  }
}

@riverpod
GetHomeSectionsUseCase getHomeSections(Ref ref) {
  return GetHomeSectionsUseCase(
    newsRepository: ref.watch(newsRepositoryProvider),
    trendingRepository: ref.watch(trendingRepositoryProvider),
    categoryRepository: ref.watch(categoryRepositoryProvider),
  );
}
