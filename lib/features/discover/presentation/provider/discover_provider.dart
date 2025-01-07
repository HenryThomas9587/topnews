import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/discover/domain/entity/discover_section.dart';
import 'package:topnews/features/discover/domain/usecase/get_discover_sections_usecase.dart';

part 'discover_provider.g.dart';

@Riverpod(keepAlive: true)
class DiscoverNotifier extends _$DiscoverNotifier {
  bool _isRefreshing = false;
  bool get isRefreshing => _isRefreshing;

  @override
  FutureOr<List<DiscoverSection>> build() async {
    logDebug("DiscoverNotifier:${hashCode.toString()}");
    return _fetchSections();
  }

  Future<List<DiscoverSection>> _fetchSections() async {
    logDebug('DiscoverNotifier _fetchSections');
    return ref.read(getDiscoverSectionsProvider).execute();
  }

  Future<void> refresh() async {
    if (_isRefreshing) {
      logDebug('DiscoverNotifier refresh: already refreshing');
      return;
    }

    logDebug('DiscoverNotifier refresh: starting refresh');
    _isRefreshing = true;

    try {
      final sections = await _fetchSections();
      state = AsyncValue.data(sections);
    } catch (e, stack) {
      logError('DiscoverNotifier refresh failed', e, stack);
      state = AsyncValue.error(e, stack);
    } finally {
      _isRefreshing = false;
    }
  }
}
