// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsDetailHash() => r'0ac3d188291ced31bb3390eecb79cb3d81bbc3d0';

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
class NewsDetailFamily extends Family<AsyncValue<NewsEntity?>> {
  /// See also [newsDetail].
  const NewsDetailFamily();

  /// See also [newsDetail].
  NewsDetailProvider call(
    String id,
  ) {
    return NewsDetailProvider(
      id,
    );
  }

  @override
  NewsDetailProvider getProviderOverride(
    covariant NewsDetailProvider provider,
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
  String? get name => r'newsDetailProvider';
}

/// See also [newsDetail].
class NewsDetailProvider extends AutoDisposeFutureProvider<NewsEntity?> {
  /// See also [newsDetail].
  NewsDetailProvider(
    String id,
  ) : this._internal(
          (ref) => newsDetail(
            ref as NewsDetailRef,
            id,
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
          id: id,
        );

  NewsDetailProvider._internal(
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
    FutureOr<NewsEntity?> Function(NewsDetailRef provider) create,
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
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<NewsEntity?> createElement() {
    return _NewsDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsDetailProvider && other.id == id;
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
mixin NewsDetailRef on AutoDisposeFutureProviderRef<NewsEntity?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _NewsDetailProviderElement
    extends AutoDisposeFutureProviderElement<NewsEntity?> with NewsDetailRef {
  _NewsDetailProviderElement(super.provider);

  @override
  String get id => (origin as NewsDetailProvider).id;
}

String _$getDocHash() => r'150b407ed740219a9726157e7249cc26dafd521f';

/// See also [getDoc].
@ProviderFor(getDoc)
const getDocProvider = GetDocFamily();

/// See also [getDoc].
class GetDocFamily extends Family<AsyncValue<Document?>> {
  /// See also [getDoc].
  const GetDocFamily();

  /// See also [getDoc].
  GetDocProvider call(
    String id,
  ) {
    return GetDocProvider(
      id,
    );
  }

  @override
  GetDocProvider getProviderOverride(
    covariant GetDocProvider provider,
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
  String? get name => r'getDocProvider';
}

/// See also [getDoc].
class GetDocProvider extends AutoDisposeFutureProvider<Document?> {
  /// See also [getDoc].
  GetDocProvider(
    String id,
  ) : this._internal(
          (ref) => getDoc(
            ref as GetDocRef,
            id,
          ),
          from: getDocProvider,
          name: r'getDocProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDocHash,
          dependencies: GetDocFamily._dependencies,
          allTransitiveDependencies: GetDocFamily._allTransitiveDependencies,
          id: id,
        );

  GetDocProvider._internal(
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
    FutureOr<Document?> Function(GetDocRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDocProvider._internal(
        (ref) => create(ref as GetDocRef),
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
  AutoDisposeFutureProviderElement<Document?> createElement() {
    return _GetDocProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDocProvider && other.id == id;
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
mixin GetDocRef on AutoDisposeFutureProviderRef<Document?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetDocProviderElement extends AutoDisposeFutureProviderElement<Document?>
    with GetDocRef {
  _GetDocProviderElement(super.provider);

  @override
  String get id => (origin as GetDocProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
