import 'package:topnews/features/home/domain/entity/trending_news_entity.dart';

final mockTrendingNews = [
  TrendingNewsEntity(
    id: '1',
    title: 'Breaking News 1',
    imageUrl: 'https://picsum.photos/400/300?random=1',
    category: 'Technology',
    subtitle: 'Investigative Report Exposes Widespread Political Corruption',
    author: 'Tim News',
    authorAvatar: 'https://picsum.photos/400/300?random=1',
    publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  TrendingNewsEntity(
    id: '2',
    title: 'Breaking News 2',
    imageUrl: 'https://picsum.photos/400/300?random=2',
    category: 'Science',
    subtitle: 'New Breakthrough in Quantum Computing',
    author: 'Science Daily',
    authorAvatar: 'https://picsum.photos/400/300?random=2',
    publishedAt: DateTime.now().subtract(const Duration(hours: 3)),
  ),
  // 添加更多mock数据...
];
