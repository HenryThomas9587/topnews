// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_publish_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsPublishDetailHash() => r'627fd1ea1a55ef2da001916eccf6aee6a92e5b5e';

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

/// See also [newsPublishDetail].
@ProviderFor(newsPublishDetail)
const newsPublishDetailProvider = NewsPublishDetailFamily();

/// See also [newsPublishDetail].
class NewsPublishDetailFamily extends Family<AsyncValue<NewsDraftEntity?>> {
  /// See also [newsPublishDetail].
  const NewsPublishDetailFamily();

  /// See also [newsPublishDetail].
  NewsPublishDetailProvider call(
    String id,
  ) {
    return NewsPublishDetailProvider(
      id,
    );
  }

  @override
  NewsPublishDetailProvider getProviderOverride(
    covariant NewsPublishDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'newsPublishDetailProvider';
}

/// See also [newsPublishDetail].
class NewsPublishDetailProvider
    extends AutoDisposeFutureProvider<NewsDraftEntity?> {
  /// See also [newsPublishDetail].
  NewsPublishDetailProvider(
    String id,
  ) : this._internal(
          (ref) => newsPublishDetail(
            ref as NewsPublishDetailRef,
            id,
          ),
          from: newsPublishDetailProvider,
          name: r'newsPublishDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsPublishDetailHash,
          dependencies: NewsPublishDetailFamily._dependencies,
          allTransitiveDependencies:
              NewsPublishDetailFamily._allTransitiveDependencies,
          id: id,
        );

  NewsPublishDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<NewsDraftEntity?> Function(NewsPublishDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewsPublishDetailProvider._internal(
        (ref) => create(ref as NewsPublishDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<NewsDraftEntity?> createElement() {
    return _NewsPublishDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsPublishDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NewsPublishDetailRef on AutoDisposeFutureProviderRef<NewsDraftEntity?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _NewsPublishDetailProviderElement
    extends AutoDisposeFutureProviderElement<NewsDraftEntity?>
    with NewsPublishDetailRef {
  _NewsPublishDetailProviderElement(super.provider);

  @override
  String get id => (origin as NewsPublishDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
