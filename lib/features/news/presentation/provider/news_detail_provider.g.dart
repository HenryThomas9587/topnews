// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsDetailNotifierHash() =>
    r'82c6b503f7b27cc15b82189a81a902194acdf004';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$NewsDetailNotifier
    extends BuildlessAutoDisposeAsyncNotifier<NewsEntity> {
  late final String newsId;

  FutureOr<NewsEntity> build(
    String newsId,
  );
}

/// See also [NewsDetailNotifier].
@ProviderFor(NewsDetailNotifier)
const newsDetailNotifierProvider = NewsDetailNotifierFamily();

/// See also [NewsDetailNotifier].
class NewsDetailNotifierFamily extends Family<AsyncValue<NewsEntity>> {
  /// See also [NewsDetailNotifier].
  const NewsDetailNotifierFamily();

  /// See also [NewsDetailNotifier].
  NewsDetailNotifierProvider call(
    String newsId,
  ) {
    return NewsDetailNotifierProvider(
      newsId,
    );
  }

  @override
  NewsDetailNotifierProvider getProviderOverride(
    covariant NewsDetailNotifierProvider provider,
  ) {
    return call(
      provider.newsId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newsDetailNotifierProvider';
}

/// See also [NewsDetailNotifier].
class NewsDetailNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    NewsDetailNotifier, NewsEntity> {
  /// See also [NewsDetailNotifier].
  NewsDetailNotifierProvider(
    String newsId,
  ) : this._internal(
          () => NewsDetailNotifier()..newsId = newsId,
          from: newsDetailNotifierProvider,
          name: r'newsDetailNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsDetailNotifierHash,
          dependencies: NewsDetailNotifierFamily._dependencies,
          allTransitiveDependencies:
              NewsDetailNotifierFamily._allTransitiveDependencies,
          newsId: newsId,
        );

  NewsDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newsId,
  }) : super.internal();

  final String newsId;

  @override
  FutureOr<NewsEntity> runNotifierBuild(
    covariant NewsDetailNotifier notifier,
  ) {
    return notifier.build(
      newsId,
    );
  }

  @override
  Override overrideWith(NewsDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: NewsDetailNotifierProvider._internal(
        () => create()..newsId = newsId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newsId: newsId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<NewsDetailNotifier, NewsEntity>
      createElement() {
    return _NewsDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsDetailNotifierProvider && other.newsId == newsId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newsId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NewsDetailNotifierRef on AutoDisposeAsyncNotifierProviderRef<NewsEntity> {
  /// The parameter `newsId` of this provider.
  String get newsId;
}

class _NewsDetailNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<NewsDetailNotifier,
        NewsEntity> with NewsDetailNotifierRef {
  _NewsDetailNotifierProviderElement(super.provider);

  @override
  String get newsId => (origin as NewsDetailNotifierProvider).newsId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
