import 'package:flutter/material.dart';

class SearchHistoryItem extends StatelessWidget {
  final String keyword;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const SearchHistoryItem({
    super.key,
    required this.keyword,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      title: Text(
        keyword,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.close, size: 16),
        onPressed: onDelete,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
