import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/discover/data/repository/discover_repository_impl.dart';
import 'package:topnews/features/discover/domain/entity/discover_section.dart';
import 'package:topnews/features/news/data/repository/news_repository_provider.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';
import 'package:topnews/features/news/domain/repository/news_repository.dart';
import 'package:topnews/features/discover/domain/repository/discover_repository.dart';

part 'get_discover_sections_usecase.g.dart';

class GetDiscoverSectionsUseCase {
  final NewsRepository newsRepository;
  final DiscoverRepository discoverRepository;

  GetDiscoverSectionsUseCase({
    required this.newsRepository,
    required this.discoverRepository,
  });

  Future<List<DiscoverSection>> execute() async {
    // 并行请求所有section数据
    final results = await Future.wait([
      newsRepository.getTopNews(),
      newsRepository.getRecommendedNews(1, 10),
    ]);
    final sections = <DiscoverSection>[
      DiscoverSection(
        type: DiscoverType.topStories,
        topStories: results[0] as List<NewsEntity>?,
      ),
      const DiscoverSection(
        type: DiscoverType.publishers,
        publishers: [],
      ),
      const DiscoverSection(
        type: DiscoverType.authors,
        authors: [],
      ),
      DiscoverSection(
        type: DiscoverType.recommended,
        recommended: results[1] as List<NewsEntity>?,
      ),
    ];

    return sections;
  }
}

@riverpod
GetDiscoverSectionsUseCase getDiscoverSections(Ref ref) {
  return GetDiscoverSectionsUseCase(
    newsRepository: ref.watch(newsRepositoryProvider),
    discoverRepository: ref.watch(discoverRepositoryProvider),
  );
}
