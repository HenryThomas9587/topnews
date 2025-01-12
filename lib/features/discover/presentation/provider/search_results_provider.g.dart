// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_results_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchResultsNotifierHash() =>
    r'7b7ec28e112488dbb54391efb300e8367614a2ad';

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

abstract class _$SearchResultsNotifier
    extends BuildlessAutoDisposeNotifier<SearchResultsState> {
  late final String initialQuery;

  SearchResultsState build(
    String initialQuery,
  );
}

/// See also [SearchResultsNotifier].
@ProviderFor(SearchResultsNotifier)
const searchResultsNotifierProvider = SearchResultsNotifierFamily();

/// See also [SearchResultsNotifier].
class SearchResultsNotifierFamily extends Family<SearchResultsState> {
  /// See also [SearchResultsNotifier].
  const SearchResultsNotifierFamily();

  /// See also [SearchResultsNotifier].
  SearchResultsNotifierProvider call(
    String initialQuery,
  ) {
    return SearchResultsNotifierProvider(
      initialQuery,
    );
  }

  @override
  SearchResultsNotifierProvider getProviderOverride(
    covariant SearchResultsNotifierProvider provider,
  ) {
    return call(
      provider.initialQuery,
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
  String? get name => r'searchResultsNotifierProvider';
}

/// See also [SearchResultsNotifier].
class SearchResultsNotifierProvider extends AutoDisposeNotifierProviderImpl<
    SearchResultsNotifier, SearchResultsState> {
  /// See also [SearchResultsNotifier].
  SearchResultsNotifierProvider(
    String initialQuery,
  ) : this._internal(
          () => SearchResultsNotifier()..initialQuery = initialQuery,
          from: searchResultsNotifierProvider,
          name: r'searchResultsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchResultsNotifierHash,
          dependencies: SearchResultsNotifierFamily._dependencies,
          allTransitiveDependencies:
              SearchResultsNotifierFamily._allTransitiveDependencies,
          initialQuery: initialQuery,
        );

  SearchResultsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialQuery,
  }) : super.internal();

  final String initialQuery;

  @override
  SearchResultsState runNotifierBuild(
    covariant SearchResultsNotifier notifier,
  ) {
    return notifier.build(
      initialQuery,
    );
  }

  @override
  Override overrideWith(SearchResultsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchResultsNotifierProvider._internal(
        () => create()..initialQuery = initialQuery,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialQuery: initialQuery,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SearchResultsNotifier, SearchResultsState>
      createElement() {
    return _SearchResultsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchResultsNotifierProvider &&
        other.initialQuery == initialQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialQuery.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchResultsNotifierRef
    on AutoDisposeNotifierProviderRef<SearchResultsState> {
  /// The parameter `initialQuery` of this provider.
  String get initialQuery;
}

class _SearchResultsNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SearchResultsNotifier,
        SearchResultsState> with SearchResultsNotifierRef {
  _SearchResultsNotifierProviderElement(super.provider);

  @override
  String get initialQuery =>
      (origin as SearchResultsNotifierProvider).initialQuery;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
