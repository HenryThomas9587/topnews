import 'package:flutter/material.dart';

class BaseSection extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;
  final Widget? trailing;
  final Widget child;

  const BaseSection({
    super.key,
    required this.title,
    this.onViewAll,
    this.trailing,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              if (trailing != null) trailing!,
              if (onViewAll != null)
                TextButton(
                  onPressed: onViewAll,
                  child: const Text('查看全部'),
                ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
