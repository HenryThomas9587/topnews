import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

extension RouterExtension on BuildContext {
  void pushNewsDetail(NewsEntity news) {
    push('/news/${news.id}');
  }
}
