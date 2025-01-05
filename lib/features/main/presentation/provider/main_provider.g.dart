// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mainNotifierHash() => r'52e526d220cd9054df663801999b9df5258ff9ea';

/// See also [MainNotifier].
@ProviderFor(MainNotifier)
final mainNotifierProvider =
    AutoDisposeAsyncNotifierProvider<MainNotifier, List<TabItem>>.internal(
  MainNotifier.new,
  name: r'mainNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mainNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MainNotifier = AutoDisposeAsyncNotifier<List<TabItem>>;
String _$mainPageControllerHash() =>
    r'c9883f8f138aa53d389cd72fa557c275fa04f4e1';

/// See also [MainPageController].
@ProviderFor(MainPageController)
final mainPageControllerProvider =
    AutoDisposeNotifierProvider<MainPageController, Map<String, bool>>.internal(
  MainPageController.new,
  name: r'mainPageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mainPageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MainPageController = AutoDisposeNotifier<Map<String, bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
