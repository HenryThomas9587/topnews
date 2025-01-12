import 'dart:collection';
import 'package:topnews/features/discover/data/model/author_model.dart';
import 'package:topnews/features/discover/data/model/base_result_model.dart';

class MockAuthorDataSource {
  // 全局对象
  static final MockAuthorDataSource _instance = MockAuthorDataSource._();
  factory MockAuthorDataSource() => _instance;

  MockAuthorDataSource._();

  // 使用 final 修饰 authorList
  final List<AuthorModel> authorList = UnmodifiableListView([
    const AuthorModel(
      id: '1',
      name: 'John Doe',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: true,
      userType: 'personal',
    ),
    const AuthorModel(
      id: '2',
      name: 'Jane Smith',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: false,
      userType: 'publisher',
    ),
    const AuthorModel(
      id: '3',
      name: 'Michael Johnson',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: true,
      userType: 'author',
    ),
    const AuthorModel(
      id: '4',
      name: 'Sarah Williams',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: false,
      userType: 'personal',
    ),
    const AuthorModel(
      id: '5',
      name: 'David Brown',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: true,
      userType: 'publisher',
    ),
    const AuthorModel(
      id: '6',
      name: 'Emily Davis',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: false,
      userType: 'author',
    ),
    const AuthorModel(
      id: '7',
      name: 'James Wilson',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: true,
      userType: 'personal',
    ),
    const AuthorModel(
      id: '8',
      name: 'Lisa Anderson',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: false,
      userType: 'publisher',
    ),
    const AuthorModel(
      id: '9',
      name: 'Robert Taylor',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: true,
      userType: 'author',
    ),
    const AuthorModel(
      id: '10',
      name: 'Jennifer Thomas',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: false,
      userType: 'personal',
    ),
    const AuthorModel(
      id: '11',
      name: 'William Moore',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: true,
      userType: 'publisher',
    ),
    const AuthorModel(
      id: '12',
      name: 'Elizabeth Jackson',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: false,
      userType: 'author',
    ),
    const AuthorModel(
      id: '13',
      name: 'Richard White',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: true,
      userType: 'personal',
    ),
    const AuthorModel(
      id: '14',
      name: 'Mary Harris',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: false,
      userType: 'publisher',
    ),
    const AuthorModel(
      id: '15',
      name: 'Joseph Clark',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: true,
      userType: 'author',
    ),
    const AuthorModel(
      id: '16',
      name: 'Susan Lewis',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: false,
      userType: 'personal',
    ),
    const AuthorModel(
      id: '17',
      name: 'Charles Lee',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: true,
      userType: 'publisher',
    ),
    const AuthorModel(
      id: '18',
      name: 'Margaret Walker',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: false,
      userType: 'author',
    ),
    const AuthorModel(
      id: '19',
      name: 'Thomas Hall',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: true,
      userType: 'personal',
    ),
    const AuthorModel(
      id: '20',
      name: 'Patricia Young',
      imageUrl: 'https://via.placeholder.com/150',
      isFollowing: false,
      userType: 'publisher',
    ),
  ]);

  List<AuthorModel> getFollowedAuthorList(int page, int pageSize) {
    return authorList
        .where((author) => author.isFollowing)
        .skip((page - 1) * pageSize)
        .take(pageSize)
        .toList();
  }

  List<AuthorModel> getRecommendedAuthorList(
      int page, int pageSize, String userType) {
    return authorList
        .where((author) => author.userType == userType)
        .skip((page - 1) * pageSize)
        .take(pageSize)
        .toList();
  }

  List<AuthorModel> getLatestAuthorList(int page, int pageSize) {
    return authorList.skip((page - 1) * pageSize).take(pageSize).toList();
  }

  List<AuthorModel> getCategoryAuthorList(String keyword) {
    return authorList.where((author) => author.name.contains(keyword)).toList();
  }

  List<AuthorModel> getSearchAuthorList(String keyword) {
    return authorList.where((author) => author.name.contains(keyword)).toList();
  }

  Future<BaseResultModel<AuthorModel?>> getFollowedAuthorResult(
      String authorId, bool isFollowing) async {
    await Future.delayed(const Duration(seconds: 2)); // 模拟2秒延迟
    final newFollowingState = !isFollowing; // 更加语义化
    // 使用原子操作更新全局集合
    List<AuthorModel> updatedList = [];
    updatedList = authorList.map((author) {
      if (author.id == authorId) {
        return author.copyWith(isFollowing: newFollowingState);
      }
      return author;
    }).toList();

    try {
      final newAuthor =
          updatedList.firstWhere((author) => author.id == authorId);
      return successResult(newAuthor);
    } on StateError catch (_) {
      return successResult(null); //处理  firstWhere 异常情况
    }
  }
}

// 成功返回的数据模型
BaseResultModel<T> successResult<T>(T? data) {
  return BaseResultModel<T>(data: data, code: 200, message: 'success');
}
