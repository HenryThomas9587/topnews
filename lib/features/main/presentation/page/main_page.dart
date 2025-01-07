import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/discover/presentation/page/discover_page.dart';
import 'package:topnews/features/home/presentation/page/home_page.dart';
import 'package:topnews/features/main/presentation/provider/main_provider.dart';
import 'package:topnews/features/main/domain/entity/tab_item.dart';
import 'package:topnews/features/profile/presentation/page/profile_page.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  Widget buildPage(TabItem tab, bool isBuilt) {
    if (!isBuilt) {
      return const SizedBox.shrink();
    }
    logDebug('MainPage: building page ${tab.id}');
    switch (tab.route) {
      case '/':
        return const HomePage();
      case '/explore':
        return const DiscoverPage();
      case '/bookmarks':
        return const Placeholder();
      case '/profile':
        return const ProfilePage();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final tabsAsync = ref.watch(mainNotifierProvider);
    final pageController = ref.watch(mainPageControllerProvider.notifier);

    return Scaffold(
      body: tabsAsync.when(
        data: (tabs) => IndexedStack(
          index: selectedIndex.value,
          children: tabs
              .map((tab) => buildPage(
                    tab,
                    pageController.isPageBuilt(tab.id),
                  ))
              .toList(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      bottomNavigationBar: tabsAsync.when(
        data: (tabs) => NavigationBar(
          selectedIndex: selectedIndex.value,
          onDestinationSelected: (index) {
            final tab = tabs[index];
            pageController.markPageAsBuilt(tab.id);
            selectedIndex.value = index;
          },
          destinations: tabs
              .map(
                (tab) => NavigationDestination(
                  icon: Icon(tab.icon),
                  selectedIcon: Icon(tab.selectedIcon),
                  label: tab.label,
                ),
              )
              .toList(),
        ),
        loading: () => const SizedBox.shrink(),
        error: (_, __) => const SizedBox.shrink(),
      ),
    );
  }
}
