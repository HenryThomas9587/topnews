// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$followNotifyHash() => r'59ea8bd6bacbfb942b89de13fc27ca5509ff1b73';

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

abstract class _$FollowNotify extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final AuthorEntity author;

  FutureOr<bool> build(
    AuthorEntity author,
  );
}

/// See also [FollowNotify].
@ProviderFor(FollowNotify)
const followNotifyProvider = FollowNotifyFamily();

/// See also [FollowNotify].
class FollowNotifyFamily extends Family<AsyncValue<bool>> {
  /// See also [FollowNotify].
  const FollowNotifyFamily();

  /// See also [FollowNotify].
  FollowNotifyProvider call(
    AuthorEntity author,
  ) {
    return FollowNotifyProvider(
      author,
    );
  }

  @override
  FollowNotifyProvider getProviderOverride(
    covariant FollowNotifyProvider provider,
  ) {
    return call(
      provider.author,
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
  String? get name => r'followNotifyProvider';
}

/// See also [FollowNotify].
class FollowNotifyProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FollowNotify, bool> {
  /// See also [FollowNotify].
  FollowNotifyProvider(
    AuthorEntity author,
  ) : this._internal(
          () => FollowNotify()..author = author,
          from: followNotifyProvider,
          name: r'followNotifyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$followNotifyHash,
          dependencies: FollowNotifyFamily._dependencies,
          allTransitiveDependencies:
              FollowNotifyFamily._allTransitiveDependencies,
          author: author,
        );

  FollowNotifyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.author,
  }) : super.internal();

  final AuthorEntity author;

  @override
  FutureOr<bool> runNotifierBuild(
    covariant FollowNotify notifier,
  ) {
    return notifier.build(
      author,
    );
  }

  @override
  Override overrideWith(FollowNotify Function() create) {
    return ProviderOverride(
      origin: this,
      override: FollowNotifyProvider._internal(
        () => create()..author = author,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        author: author,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FollowNotify, bool> createElement() {
    return _FollowNotifyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FollowNotifyProvider && other.author == author;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, author.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FollowNotifyRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `author` of this provider.
  AuthorEntity get author;
}

class _FollowNotifyProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FollowNotify, bool>
    with FollowNotifyRef {
  _FollowNotifyProviderElement(super.provider);

  @override
  AuthorEntity get author => (origin as FollowNotifyProvider).author;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
