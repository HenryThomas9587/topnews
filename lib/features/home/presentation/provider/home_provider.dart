import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/features/home/domain/usecase/get_home_sections_usecase.dart';
import 'package:topnews/features/home/domain/entity/home_section.dart';

part 'home_provider.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  static const _pageSize = 10;
  static const _maxPages = 3;

  bool _isLoadingMore = false;
  bool _isRefreshing = false;

  bool get isLoadingMore => _isLoadingMore;
  bool get isRefreshing => _isRefreshing;

  @override
  FutureOr<List<HomeSection>> build() async {
    return _fetchSections(1);
  }

  Future<List<HomeSection>> _fetchSections(int page) async {
    return ref.read(getHomeSectionsProvider).execute(
          page: page,
          pageSize: _pageSize,
        );
  }

  Future<void> loadMoreData() async {
    if (_isLoadingMore || _isRefreshing || state.isLoading || state.hasError) {
      return;
    }

    final currentSections = state.value ?? [];
    final hasMoreData =
        currentSections.any((s) => s.type == HomeSectionType.story);
    final currentPage = currentSections.length ~/ _pageSize + 1;

    if (currentPage >= _maxPages || !hasMoreData) return;

    _isLoadingMore = true;
    state = AsyncValue.data(currentSections); // 触发重绘以显示加载指示器

    try {
      final nextSections = await _fetchSections(currentPage + 1);
      state = AsyncValue.data([...currentSections, ...nextSections]);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    } finally {
      _isLoadingMore = false;
      state = AsyncValue.data(state.value ?? []); // 触发重绘以更新UI
    }
  }

  Future<void> refresh() async {
    if (_isRefreshing || _isLoadingMore) return;

    _isRefreshing = true;
    try {
      state = const AsyncLoading();
      final sections = await _fetchSections(1);
      state = AsyncValue.data(sections);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    } finally {
      _isRefreshing = false;
    }
  }
}
