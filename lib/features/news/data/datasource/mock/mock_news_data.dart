import 'dart:math';
import 'package:string_similarity/string_similarity.dart';

import 'package:topnews/features/news/data/datasource/mock/mock_auth_data_sets.dart';
import 'package:topnews/features/news/data/datasource/mock/mock_category_data_sets.dart';
import 'package:topnews/features/news/data/datasource/mock/quill_delta_sample.dart';
import 'package:topnews/features/news/data/model/news_model.dart';

class MockNewsDataSource {
  static final MockNewsDataSource _instance = MockNewsDataSource._internal();

  factory MockNewsDataSource() {
    return _instance;
  }

  MockNewsDataSource._internal() {
    _init();
  }

  final mockNewsList = List.generate(30, (index) {
    final id = (index + 1).toString();
    final randomImage =
        'https://picsum.photos/400/300?random=${DateTime.now().millisecondsSinceEpoch + index}';
    const categories = MockCategoryDataSets.categories;
    const authors = MockAuthDataSets.authors;
    final random = Random();

    // 随机选择分类和作者
    final randomCategory = categories[random.nextInt(categories.length)];
    final randomAuthor = authors[random.nextInt(authors.length)];

    // 随机生成时间（最近30天内）
    final randomDate = DateTime.now().subtract(Duration(
      days: random.nextInt(30),
      hours: random.nextInt(24),
      minutes: random.nextInt(60),
    ));

    // 随机生成阅读时间（3-10分钟）
    final randomReadTime = 3 + random.nextInt(8);

    // 随机生成点赞、浏览、评论数
    final randomLikes = 1000 + random.nextInt(5000);
    final randomViews = 5000 + random.nextInt(20000);
    final randomComments = 100 + random.nextInt(500);

    return NewsModel(
      id: id,
      title: '新闻标题 $id - ${randomCategory.label}领域新突破',
      content: '这是关于${randomCategory.label}领域的详细新闻内容，描述了最新的发展和突破',
      imageUrl: randomImage,
      cover: randomImage,
      category: randomCategory.name,
      categoryId: randomCategory.id,
      author: randomAuthor.name,
      authorAvatar: randomAuthor.imageUrl,
      publishedAt: randomDate,
      readTime: randomReadTime,
      likes: randomLikes,
      views: randomViews,
      comments: randomComments,
    );
  });

  void _init() {}

  List<NewsModel> getTrendingNews(int page, int pageSize) {
    final start = (page - 1) * pageSize;
    final end = page * pageSize;
    if (start >= mockNewsList.length) return [];
    return mockNewsList.sublist(start, end.clamp(0, mockNewsList.length));
  }

  List<NewsModel> getTopNews() {
    // 按点赞数、浏览数、评论数综合排序
    final sortedList = mockNewsList.sublist(0);
    sortedList.sort((a, b) {
      final aScore = a.likes + a.views + a.comments;
      final bScore = b.likes + b.views + b.comments;
      return bScore.compareTo(aScore); // 降序排列
    });
    return sortedList.sublist(0, 10.clamp(0, sortedList.length));
  }

  List<NewsModel> getRecommendedNews(int page, int pageSize) {
    final start = (page - 1) * pageSize;
    final end = page * pageSize;
    if (start >= mockNewsList.length) return [];
    return mockNewsList.sublist(start, end.clamp(0, mockNewsList.length));
  }

  List<NewsModel> getLatestNews(int page, int pageSize) {
    final start = (page - 1) * pageSize;
    final end = page * pageSize;
    if (start >= mockNewsList.length) return [];
    return mockNewsList.sublist(start, end.clamp(0, mockNewsList.length));
  }

  static const matchBy = 'title';

  List<NewsModel> searchNews(int page, int pageSize, String keyword) {
    // 使用字符串相似度库进行模糊匹配
    final filteredList = mockNewsList.where((news) {
      final similarity = keyword.similarityTo(news.title);
      return similarity > 0.5; // 相似度阈值设为0.7
    }).toList();

    final start = (page - 1) * pageSize;
    final end = page * pageSize;
    if (start >= filteredList.length) return [];
    return filteredList.sublist(start, end.clamp(0, filteredList.length));
  }

  NewsModel getNewsDetailById(String newsId) {
    NewsModel news = mockNewsList.firstWhere((news) => news.id == newsId);
    return news.copyWith(content: kQuillDefaultSampleJson);
  }

  List<NewsModel> getCategoryNews(int page, int pageSize, String categoryId) {
    final start = (page - 1) * pageSize;
    final end = page * pageSize;
    if (categoryId == '0' || categoryId == 'all' || categoryId == '') {
      return mockNewsList.sublist(start, end.clamp(0, mockNewsList.length));
    }
    final filteredList = mockNewsList
        .where((news) => news.categoryId.toString() == categoryId)
        .toList();
    if (start >= filteredList.length) return [];
    return filteredList.sublist(start, end.clamp(0, filteredList.length));
  }
}
