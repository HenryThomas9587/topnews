import 'package:topnews/features/discover/domain/entity/author_entity.dart';
import 'package:topnews/features/discover/domain/entity/publisher_entity.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

enum DiscoverType {
  topStories('Top Stories'),
  publishers('Publishers'),
  authors('Authors'),
  recommended('Recommended');

  final String value;
  const DiscoverType(this.value);
}

class DiscoverSection {
  final DiscoverType type;
  final List<NewsEntity>? topStories;
  final List<PublisherEntity>? publishers;
  final List<AuthorEntity>? authors;
  final List<NewsEntity>? recommended;

  const DiscoverSection({
    required this.type,
    this.topStories,
    this.publishers,
    this.authors,
    this.recommended,
  });
}
