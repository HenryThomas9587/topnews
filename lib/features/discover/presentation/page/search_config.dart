import 'package:flutter/material.dart';
import 'package:topnews/features/discover/config/author_type.dart';
import 'package:topnews/features/discover/config/tag_type.dart';
import 'package:topnews/features/discover/config/user_type.dart';
import 'package:topnews/features/discover/domain/entity/search_type.dart';
import 'package:topnews/features/discover/presentation/widget/author_page_list.dart';
import 'package:topnews/features/discover/presentation/widget/tag_page_list.dart';
import 'package:topnews/features/news/config/news_type.dart';
import 'package:topnews/features/news/presentation/widget/news_page_list.dart';

typedef SearchWidgetBuilder = Widget Function(String query);

class SearchConfig {
  static const List<SearchType> searchTypes = [
    SearchType.stories,
    SearchType.accounts,
    SearchType.tags,
  ];

  static final Map<SearchType, SearchWidgetBuilder> searchTypeWidgets = {
    SearchType.stories: (String query) => NewsPageList(
          newsType: NewsType.search,
          query: query,
        ),
    SearchType.accounts: (String query) => AuthorPageList(
          userType: UserType.personal,
          authorType: AuthorType.search,
          query: query,
        ),
    SearchType.tags: (String query) => TagPageList(
          tagType: TagType.search,
          query: query,
        ),
  };
}
