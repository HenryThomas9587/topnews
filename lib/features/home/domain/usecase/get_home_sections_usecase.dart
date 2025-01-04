import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/home/data/repository/category_repository_impl.dart';
import 'package:topnews/features/home/data/repository/story_repository_provider.dart';
import 'package:topnews/features/home/data/repository/trending_repository_impl.dart';
import 'package:topnews/features/home/domain/entity/home_section.dart';
import 'package:topnews/features/home/domain/entity/story_entity.dart';
import 'package:topnews/features/home/domain/entity/trending_news_entity.dart';
import 'package:topnews/features/home/domain/repository/story_repository.dart';
import 'package:topnews/features/home/domain/repository/trending_repository.dart';
import 'package:topnews/features/home/domain/repository/category_repository.dart';

part 'get_home_sections_usecase.g.dart';

class GetHomeSectionsUseCase {
  final StoryRepository storyRepository;
  final TrendingRepository trendingRepository;
  final CategoryRepository categoryRepository;

  GetHomeSectionsUseCase({
    required this.storyRepository,
    required this.trendingRepository,
    required this.categoryRepository,
  });

  Future<List<HomeSection>> execute({int page = 1, int pageSize = 10}) async {
    if (page == 1) {
      // 并行请求所有section数据
      final results = await Future.wait([
        trendingRepository.getTrendingNews(),
        categoryRepository.getCategories(),
        storyRepository.getStories(
          page: page,
          pageSize: pageSize,
        ),
      ]);

      final trending = results[0] as List<TrendingNewsEntity>;
      final categories = results[1] as List<String>;
      final stories = results[2] as List<StoryEntity>;
      final sectionList = [
        HomeSection(
          type: HomeSectionType.trending,
          trendingNews: trending,
          title: 'Trending Now',
        ),
        HomeSection(
          type: HomeSectionType.category,
          title: 'Categories',
          category: categories,
        ),
      ];
      sectionList.addAll(stories.map((story) => HomeSection(
            type: HomeSectionType.story,
            item: story,
          )));
      return sectionList;
    } else {
      // 后续页面只加载stories
      final stories = await storyRepository.getStories(
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
    storyRepository: ref.watch(storyRepositoryProvider),
    trendingRepository: ref.watch(trendingRepositoryProvider),
    categoryRepository: ref.watch(categoryRepositoryProvider),
  );
}
