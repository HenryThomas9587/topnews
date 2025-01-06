import 'dart:math';
import 'package:topnews/features/news/data/datasource/mock/mock_category_data_sets.dart';
import 'package:topnews/features/news/data/datasource/mock/mock_data_sets.dart';
import 'package:topnews/features/news/data/model/category_model.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

class MockStoryData {
  static final _random = Random();

  static String getRandomTitle() {
    return _getRandomElement(MockDataSets.titles);
  }

  static String getRandomContent() {
    return _getRandomElement(MockDataSets.contents);
  }

  static String getRandomAuthor() {
    return _getRandomElement(MockDataSets.authors);
  }

  static CategoryModel getRandomCategory() {
    const categories = MockCategoryDataSets.categories;
    final randomIndex = _random.nextInt(categories.length);
    final randomCategory = categories[randomIndex];
    return CategoryModel(
      id: randomCategory['id'] as int,
      name: randomCategory['name'] as String,
      label: randomCategory['label'] as String,
      icon: randomCategory['icon'] as String,
      order: randomCategory['order'] as int,
    );
  }

  static String _getRandomElement(List<String> list) {
    return list[_random.nextInt(list.length)];
  }

  static int getRandomNumber(int min, int max) {
    return min + _random.nextInt(max - min);
  }

  static DateTime getRandomDate() {
    final now = DateTime.now();
    return now.subtract(Duration(
      hours: _random.nextInt(24 * 7), // 最近一周内
      minutes: _random.nextInt(60),
    ));
  }

  static List<NewsEntity> mockStories(int pageSize) {
    return List.generate(
      pageSize,
      (index) => NewsEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString() + index.toString(),
        title: MockStoryData.getRandomTitle(),
        content: MockStoryData.getRandomContent(),
        imageUrl:
            'https://picsum.photos/400/300?random=${DateTime.now().millisecondsSinceEpoch + index}',
        author: MockStoryData.getRandomAuthor(),
        authorAvatar: 'https://i.pravatar.cc/150?img=${(index % 10) + 1}',
        publishedAt: MockStoryData.getRandomDate(),
        readTime: MockStoryData.getRandomNumber(3, 10),
        likes: MockStoryData.getRandomNumber(50, 1000),
        views: MockStoryData.getRandomNumber(1000, 10000),
        comments: MockStoryData.getRandomNumber(10, 100),
        category: MockStoryData.getRandomCategory().name,
        categoryId: MockStoryData.getRandomCategory().id,
      ),
    );
  }
}
