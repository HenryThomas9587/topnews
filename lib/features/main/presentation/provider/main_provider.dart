import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/main/data/repository/app_config_repository_impl.dart';
import 'package:topnews/features/main/domain/entity/tab_item.dart';

part 'main_provider.g.dart';

@riverpod
class MainNotifier extends _$MainNotifier {
  @override
  Future<List<TabItem>> build() async {
    logDebug('MainNotifier build');
    return ref.read(appConfigRepositoryProvider).getTabItems();
  }
}

@riverpod
class MainPageController extends _$MainPageController {
  @override
  Map<String, bool> build() {
    final tabsAsync = ref.watch(mainNotifierProvider);
    return tabsAsync.when(
      data: (tabs) => tabs.fold<Map<String, bool>>(
        {},
        (map, tab) => {
          ...map,
          tab.id: tab.id == 'home',
        },
      ),
      loading: () => const {},
      error: (_, __) => const {},
    );
  }

  void markPageAsBuilt(String tabId) {
    if (!state.containsKey(tabId)) return;
    state = {...state, tabId: true};
  }

  bool isPageBuilt(String tabId) {
    return state[tabId] ?? false;
  }
}
