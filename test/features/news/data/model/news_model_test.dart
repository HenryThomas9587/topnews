import 'package:flutter_test/flutter_test.dart';
import 'package:topnews/features/news/data/model/news_model.dart';

void main() {
  group('NewsModel Tests', () {
    test('fromJson should correctly parse JSON', () {
      final json = {
        'id': 1,
        'title': 'Test Title',
        'body': 'Test Content',
        'userId': 1,
      };

      final model = NewsModel.fromJson(json);

      expect(model.id, '1');
      expect(model.title, 'Test Title');
      expect(model.content, 'Test Content');
      expect(model.userId, 1);
    });

    test('toEntity should convert to NewsEntity', () {
      const model = NewsModel(
        id: '1',
        title: 'Test Title',
        content: 'Test Content',
        userId: 1,
        imageUrl: 'https://example.com/image.jpg',
      );

      final entity = model.toEntity();

      expect(entity.id, '1');
      expect(entity.title, 'Test Title');
      expect(entity.content, 'Test Content');
      expect(entity.imageUrl, 'https://example.com/image.jpg');
    });
  });
}
