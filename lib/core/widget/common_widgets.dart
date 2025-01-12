import 'package:flutter/material.dart';
import 'package:topnews/core/theme/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}

class NoMoreDataWidget extends StatelessWidget {
  final VoidCallback? onRetry;
  final bool isLoadingMore;

  const NoMoreDataWidget({
    super.key,
    this.onRetry,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      child: isLoadingMore
          ? const Center(child: CircularProgressIndicator())
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '没有更多数据了',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: 14,
                  ),
                ),
                if (onRetry != null)
                  Padding(
                    padding: const EdgeInsets.only(left: AppTheme.spaceXs),
                    child: IconButton(
                      onPressed: onRetry,
                      icon: const Icon(Icons.refresh),
                    ),
                  ),
              ],
            ),
    );
  }
}

class EmptyView extends StatelessWidget {
  final String message;
  final IconData? icon;

  const EmptyView({
    super.key,
    required this.message,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: AppTheme.contentPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.search_off,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: AppTheme.spaceMd),
            Text(
              message,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  final Object? error;
  final VoidCallback? onRetry;
  final bool isLoadMoreError;

  const ErrorView({
    super.key,
    this.error,
    this.onRetry,
    this.isLoadMoreError = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
        padding: isLoadMoreError
            ? AppTheme.contentPadding
                .copyWith(bottom: AppTheme.spaceXs, top: AppTheme.spaceXs)
            : AppTheme.contentPadding,
        child: isLoadMoreError
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 24,
                    color: theme.colorScheme.error,
                  ),
                  const SizedBox(width: AppTheme.spaceXs),
                  Expanded(
                    child: Text(
                      'Load more failed',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: AppTheme.spaceXs),
                  if (onRetry != null)
                    IconButton(
                      onPressed: onRetry,
                      icon: const Icon(Icons.refresh),
                    ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: theme.colorScheme.error,
                  ),
                  const SizedBox(height: AppTheme.spaceMd),
                  Text(
                    'Something went wrong',
                    style: theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppTheme.spaceXs),
                  Text(
                    error.toString(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (onRetry != null) ...[
                    const SizedBox(height: AppTheme.spaceLg),
                    FilledButton.icon(
                      onPressed: onRetry,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Try Again'),
                    ),
                  ],
                ],
              ));
  }
}
