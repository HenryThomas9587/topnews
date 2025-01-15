import 'package:topnews/features/discover/domain/entity/author_entity.dart';
import 'package:topnews/features/discover/domain/entity/publisher_entity.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

enum DiscoverType {
  topStories(name: 'topStories', value: 'Top Stories'),
  publishers(name: 'publishers', value: 'Publishers'),
  authors(name: 'authors', value: 'Authors'),
  recommended(name: 'recommended', value: 'Recommended');

  final String name;
  final String value;
  const DiscoverType({required this.name, required this.value});
}

class DiscoverSection {
  final DiscoverType type;
  final List<NewsEntity>? topStories;
  final List<PublisherEntity>? publishers;
  final List<AuthorEntity>? authors;
  final List<NewsEntity>? recommendList;

  const DiscoverSection({
    required this.type,
    this.topStories,
    this.publishers,
    this.authors,
    this.recommendList,
  });
}
