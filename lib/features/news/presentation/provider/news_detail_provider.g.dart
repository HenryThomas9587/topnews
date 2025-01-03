// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsDetailHash() => r'55e5aff3bed4f0808e151a15f3f678e8e143ea3d';

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

/// See also [newsDetail].
@ProviderFor(newsDetail)
const newsDetailProvider = NewsDetailFamily();

/// See also [newsDetail].
class NewsDetailFamily extends Family<AsyncValue<NewsEntity>> {
  /// See also [newsDetail].
  const NewsDetailFamily();

  /// See also [newsDetail].
  NewsDetailProvider call(
    String newsId,
  ) {
    return NewsDetailProvider(
      newsId,
    );
  }

  @override
  NewsDetailProvider getProviderOverride(
    covariant NewsDetailProvider provider,
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
  String? get name => r'newsDetailProvider';
}

/// See also [newsDetail].
class NewsDetailProvider extends AutoDisposeFutureProvider<NewsEntity> {
  /// See also [newsDetail].
  NewsDetailProvider(
    String newsId,
  ) : this._internal(
          (ref) => newsDetail(
            ref as NewsDetailRef,
            newsId,
          ),
          from: newsDetailProvider,
          name: r'newsDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsDetailHash,
          dependencies: NewsDetailFamily._dependencies,
          allTransitiveDependencies:
              NewsDetailFamily._allTransitiveDependencies,
          newsId: newsId,
        );

  NewsDetailProvider._internal(
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
  Override overrideWith(
    FutureOr<NewsEntity> Function(NewsDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewsDetailProvider._internal(
        (ref) => create(ref as NewsDetailRef),
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
  AutoDisposeFutureProviderElement<NewsEntity> createElement() {
    return _NewsDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsDetailProvider && other.newsId == newsId;
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
mixin NewsDetailRef on AutoDisposeFutureProviderRef<NewsEntity> {
  /// The parameter `newsId` of this provider.
  String get newsId;
}

class _NewsDetailProviderElement
    extends AutoDisposeFutureProviderElement<NewsEntity> with NewsDetailRef {
  _NewsDetailProviderElement(super.provider);

  @override
  String get newsId => (origin as NewsDetailProvider).newsId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
