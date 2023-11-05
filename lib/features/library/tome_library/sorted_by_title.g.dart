// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sorted_by_title.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tomeLibrarySortedByTitleHash() =>
    r'164cd5091912fa46ad6f6d6791d88acc6728ab26';

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

/// See also [tomeLibrarySortedByTitle].
@ProviderFor(tomeLibrarySortedByTitle)
const tomeLibrarySortedByTitleProvider = TomeLibrarySortedByTitleFamily();

/// See also [tomeLibrarySortedByTitle].
class TomeLibrarySortedByTitleFamily
    extends Family<AsyncValue<LinkedHashMap<String, CachedTome>>> {
  /// See also [tomeLibrarySortedByTitle].
  const TomeLibrarySortedByTitleFamily();

  /// See also [tomeLibrarySortedByTitle].
  TomeLibrarySortedByTitleProvider call(
    TomeLibrarySearchData data,
  ) {
    return TomeLibrarySortedByTitleProvider(
      data,
    );
  }

  @override
  TomeLibrarySortedByTitleProvider getProviderOverride(
    covariant TomeLibrarySortedByTitleProvider provider,
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
  String? get name => r'tomeLibrarySortedByTitleProvider';
}

/// See also [tomeLibrarySortedByTitle].
class TomeLibrarySortedByTitleProvider
    extends AutoDisposeFutureProvider<LinkedHashMap<String, CachedTome>> {
  /// See also [tomeLibrarySortedByTitle].
  TomeLibrarySortedByTitleProvider(
    TomeLibrarySearchData data,
  ) : this._internal(
          (ref) => tomeLibrarySortedByTitle(
            ref as TomeLibrarySortedByTitleRef,
            data,
          ),
          from: tomeLibrarySortedByTitleProvider,
          name: r'tomeLibrarySortedByTitleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tomeLibrarySortedByTitleHash,
          dependencies: TomeLibrarySortedByTitleFamily._dependencies,
          allTransitiveDependencies:
              TomeLibrarySortedByTitleFamily._allTransitiveDependencies,
          data: data,
        );

  TomeLibrarySortedByTitleProvider._internal(
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
    FutureOr<LinkedHashMap<String, CachedTome>> Function(
            TomeLibrarySortedByTitleRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TomeLibrarySortedByTitleProvider._internal(
        (ref) => create(ref as TomeLibrarySortedByTitleRef),
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
  AutoDisposeFutureProviderElement<LinkedHashMap<String, CachedTome>>
      createElement() {
    return _TomeLibrarySortedByTitleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TomeLibrarySortedByTitleProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TomeLibrarySortedByTitleRef
    on AutoDisposeFutureProviderRef<LinkedHashMap<String, CachedTome>> {
  /// The parameter `data` of this provider.
  TomeLibrarySearchData get data;
}

class _TomeLibrarySortedByTitleProviderElement
    extends AutoDisposeFutureProviderElement<LinkedHashMap<String, CachedTome>>
    with TomeLibrarySortedByTitleRef {
  _TomeLibrarySortedByTitleProviderElement(super.provider);

  @override
  TomeLibrarySearchData get data =>
      (origin as TomeLibrarySortedByTitleProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
