// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tome_library.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tomeLibrarySortedByTitleHash() =>
    r'c4ddc650cee412cfc1e5700d8fd80961fb75cb9c';

/// See also [tomeLibrarySortedByTitle].
@ProviderFor(tomeLibrarySortedByTitle)
final tomeLibrarySortedByTitleProvider =
    AutoDisposeFutureProvider<LinkedHashMap<String, CachedTome>>.internal(
  tomeLibrarySortedByTitle,
  name: r'tomeLibrarySortedByTitleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tomeLibrarySortedByTitleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TomeLibrarySortedByTitleRef
    = AutoDisposeFutureProviderRef<LinkedHashMap<String, CachedTome>>;
String _$tomeLibraryGroupedByAuthorAndSortedByTitleHash() =>
    r'f715393b76a8bb8e577d7e61596a707a9d824ff1';

/// See also [tomeLibraryGroupedByAuthorAndSortedByTitle].
@ProviderFor(tomeLibraryGroupedByAuthorAndSortedByTitle)
final tomeLibraryGroupedByAuthorAndSortedByTitleProvider =
    AutoDisposeFutureProvider<
        SplayTreeMap<String, LinkedHashMap<String, CachedTome>>>.internal(
  tomeLibraryGroupedByAuthorAndSortedByTitle,
  name: r'tomeLibraryGroupedByAuthorAndSortedByTitleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tomeLibraryGroupedByAuthorAndSortedByTitleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TomeLibraryGroupedByAuthorAndSortedByTitleRef
    = AutoDisposeFutureProviderRef<
        SplayTreeMap<String, LinkedHashMap<String, CachedTome>>>;
String _$tomeLibraryHash() => r'7920fbd57515586eb38c2f302b24e0b08d460c09';

/// See also [TomeLibrary].
@ProviderFor(TomeLibrary)
final tomeLibraryProvider =
    AsyncNotifierProvider<TomeLibrary, Map<String, CachedTome>>.internal(
  TomeLibrary.new,
  name: r'tomeLibraryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tomeLibraryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TomeLibrary = AsyncNotifier<Map<String, CachedTome>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
