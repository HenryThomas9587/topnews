import 'package:flutter/material.dart';

class ImageErrorPlaceholder extends StatelessWidget {
  final Color? color;

  const ImageErrorPlaceholder({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Center(
        child: Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
