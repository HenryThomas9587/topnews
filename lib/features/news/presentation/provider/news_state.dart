import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/news/domain/entity/news_entity.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const NewsState._();

  const factory NewsState({
    @Default('all') String selectedCategory,
    @Default(AsyncValue.loading()) AsyncValue<List<NewsEntity>> news,
    @Default(1) int currentPage,
    @Default(false) bool hasNextPage,
    @Default(false) bool isLoadingMore,
  }) = _NewsState;

  List<NewsEntity>? get filteredNews {
    return news.whenOrNull(
      data: (allNews) => selectedCategory == 'all'
          ? allNews
          : allNews.where((item) => item.category == selectedCategory).toList(),
    );
  }
}
