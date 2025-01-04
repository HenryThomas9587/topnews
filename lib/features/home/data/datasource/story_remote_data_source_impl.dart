import 'package:topnews/features/home/data/datasource/story_data_source.dart';
import 'package:topnews/features/home/domain/entity/story_entity.dart';

class StoryRemoteDataSourceImpl implements StoryRemoteDataSource {
  @override
  Future<List<StoryEntity>> getStories(
      {int page = 1, int pageSize = 10}) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 1));

    // 模拟分页数据
    final startIndex = (page - 1) * pageSize;
    final endIndex = startIndex + pageSize;

    // 生成模拟数据
    return List.generate(
      pageSize,
      (index) => StoryEntity(
        id: '${startIndex + index}',
        title: '标题 ${startIndex + index}',
        content: '内容 ${startIndex + index}',
        imageUrl: 'https://picsum.photos/400/300?random=${startIndex + index}',
        author: '作者 ${startIndex + index}',
        authorAvatar: 'https://i.pravatar.cc/150?img=${startIndex + index}',
        publishedAt: DateTime.now().subtract(Duration(hours: index)),
        readTime: 3 + (index % 5),
        likes: 10 + (index * 5),
        comments: 5 + (index * 3),
      ),
    );
  }
}
