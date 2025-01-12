import 'package:topnews/features/discover/data/model/search_history_model.dart';

class MockSearchData {
  final List<SearchHistoryModel> searchHistoryList = List.generate(20, (index) {
    final keywords = [
      'Technology',
      'Sports',
      'Entertainment',
      'Finance',
      'Education',
      'Health',
      'Travel',
      'Food',
      'Car',
      'House'
    ];
    final randomKeyword = keywords[index % keywords.length];
    return SearchHistoryModel(
      id: (index + 1).toString(),
      keyword: '$randomKeyword${index + 1}',
      createdAt: DateTime.now().subtract(Duration(days: index)),
    );
  });

  List<SearchHistoryModel> getSearchHistory() {
    return searchHistoryList;
  }

  void addSearchHistory(String keyword) {
    final newHistory = SearchHistoryModel(
      id: (searchHistoryList.length + 1).toString(),
      keyword: keyword,
      createdAt: DateTime.now(),
    );
    searchHistoryList.insert(0, newHistory);
  }

  void removeSearchHistory(String id) {
    searchHistoryList.removeWhere((history) => history.id == id);
  }
}
