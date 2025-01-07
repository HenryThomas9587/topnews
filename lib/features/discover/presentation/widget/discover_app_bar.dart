import 'package:flutter/material.dart';
import 'package:topnews/features/news/presentation/widget/search_button.dart';

class DiscoverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiscoverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Discover'),
      actions: [
        SearchButton(
          onPressed: () {
            // TODO: Implement search
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
