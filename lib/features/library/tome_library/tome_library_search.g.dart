// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tome_library_search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tomeLibrarySearchHash() => r'c9581010bd256831da98e79bb48dc3b079ee3675';

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

/// See also [tomeLibrarySearch].
@ProviderFor(tomeLibrarySearch)
const tomeLibrarySearchProvider = TomeLibrarySearchFamily();

/// See also [tomeLibrarySearch].
class TomeLibrarySearchFamily
    extends Family<AsyncValue<Map<String, CachedTome>>> {
  /// See also [tomeLibrarySearch].
  const TomeLibrarySearchFamily();

  /// See also [tomeLibrarySearch].
  TomeLibrarySearchProvider call(
    TomeLibrarySearchData data,
  ) {
    return TomeLibrarySearchProvider(
      data,
    );
  }

  @override
  TomeLibrarySearchProvider getProviderOverride(
    covariant TomeLibrarySearchProvider provider,
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
  String? get name => r'tomeLibrarySearchProvider';
}

/// See also [tomeLibrarySearch].
class TomeLibrarySearchProvider
    extends AutoDisposeFutureProvider<Map<String, CachedTome>> {
  /// See also [tomeLibrarySearch].
  TomeLibrarySearchProvider(
    TomeLibrarySearchData data,
  ) : this._internal(
          (ref) => tomeLibrarySearch(
            ref as TomeLibrarySearchRef,
            data,
          ),
          from: tomeLibrarySearchProvider,
          name: r'tomeLibrarySearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tomeLibrarySearchHash,
          dependencies: TomeLibrarySearchFamily._dependencies,
          allTransitiveDependencies:
              TomeLibrarySearchFamily._allTransitiveDependencies,
          data: data,
        );

  TomeLibrarySearchProvider._internal(
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
    FutureOr<Map<String, CachedTome>> Function(TomeLibrarySearchRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TomeLibrarySearchProvider._internal(
        (ref) => create(ref as TomeLibrarySearchRef),
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
  AutoDisposeFutureProviderElement<Map<String, CachedTome>> createElement() {
    return _TomeLibrarySearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TomeLibrarySearchProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TomeLibrarySearchRef
    on AutoDisposeFutureProviderRef<Map<String, CachedTome>> {
  /// The parameter `data` of this provider.
  TomeLibrarySearchData get data;
}

class _TomeLibrarySearchProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, CachedTome>>
    with TomeLibrarySearchRef {
  _TomeLibrarySearchProviderElement(super.provider);

  @override
  TomeLibrarySearchData get data => (origin as TomeLibrarySearchProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
