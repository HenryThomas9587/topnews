import 'package:flutter/material.dart';

class BaseSection extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;
  final Widget child;

  const BaseSection({
    super.key,
    required this.title,
    required this.child,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (onViewAll != null)
                TextButton(
                  onPressed: onViewAll,
                  child: const Text('View all'),
                ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
