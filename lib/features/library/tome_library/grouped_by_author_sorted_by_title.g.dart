// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grouped_by_author_sorted_by_title.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tomeLibraryGroupedByAuthorAndSortedByTitleHash() =>
    r'82f41198db63411c6cc04aa219e7e9912eec6e72';

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

/// See also [tomeLibraryGroupedByAuthorAndSortedByTitle].
@ProviderFor(tomeLibraryGroupedByAuthorAndSortedByTitle)
const tomeLibraryGroupedByAuthorAndSortedByTitleProvider =
    TomeLibraryGroupedByAuthorAndSortedByTitleFamily();

/// See also [tomeLibraryGroupedByAuthorAndSortedByTitle].
class TomeLibraryGroupedByAuthorAndSortedByTitleFamily extends Family<
    AsyncValue<SplayTreeMap<String, LinkedHashMap<String, CachedTome>>>> {
  /// See also [tomeLibraryGroupedByAuthorAndSortedByTitle].
  const TomeLibraryGroupedByAuthorAndSortedByTitleFamily();

  /// See also [tomeLibraryGroupedByAuthorAndSortedByTitle].
  TomeLibraryGroupedByAuthorAndSortedByTitleProvider call(
    TomeLibrarySearchData data,
  ) {
    return TomeLibraryGroupedByAuthorAndSortedByTitleProvider(
      data,
    );
  }

  @override
  TomeLibraryGroupedByAuthorAndSortedByTitleProvider getProviderOverride(
    covariant TomeLibraryGroupedByAuthorAndSortedByTitleProvider provider,
  ) {
    return call(
      provider.data,
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
  String? get name => r'tomeLibraryGroupedByAuthorAndSortedByTitleProvider';
}

/// See also [tomeLibraryGroupedByAuthorAndSortedByTitle].
class TomeLibraryGroupedByAuthorAndSortedByTitleProvider
    extends AutoDisposeFutureProvider<
        SplayTreeMap<String, LinkedHashMap<String, CachedTome>>> {
  /// See also [tomeLibraryGroupedByAuthorAndSortedByTitle].
  TomeLibraryGroupedByAuthorAndSortedByTitleProvider(
    TomeLibrarySearchData data,
  ) : this._internal(
          (ref) => tomeLibraryGroupedByAuthorAndSortedByTitle(
            ref as TomeLibraryGroupedByAuthorAndSortedByTitleRef,
            data,
          ),
          from: tomeLibraryGroupedByAuthorAndSortedByTitleProvider,
          name: r'tomeLibraryGroupedByAuthorAndSortedByTitleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tomeLibraryGroupedByAuthorAndSortedByTitleHash,
          dependencies:
              TomeLibraryGroupedByAuthorAndSortedByTitleFamily._dependencies,
          allTransitiveDependencies:
              TomeLibraryGroupedByAuthorAndSortedByTitleFamily
                  ._allTransitiveDependencies,
          data: data,
        );

  TomeLibraryGroupedByAuthorAndSortedByTitleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final TomeLibrarySearchData data;

  @override
  Override overrideWith(
    FutureOr<SplayTreeMap<String, LinkedHashMap<String, CachedTome>>> Function(
            TomeLibraryGroupedByAuthorAndSortedByTitleRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TomeLibraryGroupedByAuthorAndSortedByTitleProvider._internal(
        (ref) => create(ref as TomeLibraryGroupedByAuthorAndSortedByTitleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<
      SplayTreeMap<String, LinkedHashMap<String, CachedTome>>> createElement() {
    return _TomeLibraryGroupedByAuthorAndSortedByTitleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TomeLibraryGroupedByAuthorAndSortedByTitleProvider &&
        other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TomeLibraryGroupedByAuthorAndSortedByTitleRef
    on AutoDisposeFutureProviderRef<
        SplayTreeMap<String, LinkedHashMap<String, CachedTome>>> {
  /// The parameter `data` of this provider.
  TomeLibrarySearchData get data;
}

class _TomeLibraryGroupedByAuthorAndSortedByTitleProviderElement
    extends AutoDisposeFutureProviderElement<
        SplayTreeMap<String, LinkedHashMap<String, CachedTome>>>
    with TomeLibraryGroupedByAuthorAndSortedByTitleRef {
  _TomeLibraryGroupedByAuthorAndSortedByTitleProviderElement(super.provider);

  @override
  TomeLibrarySearchData get data =>
      (origin as TomeLibraryGroupedByAuthorAndSortedByTitleProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
