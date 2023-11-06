// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tome_library_tome.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tomeLibraryTomeHash() => r'f1d42c139f9dc437b9fe699378e1b0a2cf810674';

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

/// See also [tomeLibraryTome].
@ProviderFor(tomeLibraryTome)
const tomeLibraryTomeProvider = TomeLibraryTomeFamily();

/// See also [tomeLibraryTome].
class TomeLibraryTomeFamily extends Family<AsyncValue<CachedTome>> {
  /// See also [tomeLibraryTome].
  const TomeLibraryTomeFamily();

  /// See also [tomeLibraryTome].
  TomeLibraryTomeProvider call(
    String id,
  ) {
    return TomeLibraryTomeProvider(
      id,
    );
  }

  @override
  TomeLibraryTomeProvider getProviderOverride(
    covariant TomeLibraryTomeProvider provider,
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
  String? get name => r'tomeLibraryTomeProvider';
}

/// See also [tomeLibraryTome].
class TomeLibraryTomeProvider extends AutoDisposeFutureProvider<CachedTome> {
  /// See also [tomeLibraryTome].
  TomeLibraryTomeProvider(
    String id,
  ) : this._internal(
          (ref) => tomeLibraryTome(
            ref as TomeLibraryTomeRef,
            id,
          ),
          from: tomeLibraryTomeProvider,
          name: r'tomeLibraryTomeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tomeLibraryTomeHash,
          dependencies: TomeLibraryTomeFamily._dependencies,
          allTransitiveDependencies:
              TomeLibraryTomeFamily._allTransitiveDependencies,
          id: id,
        );

  TomeLibraryTomeProvider._internal(
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
    FutureOr<CachedTome> Function(TomeLibraryTomeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TomeLibraryTomeProvider._internal(
        (ref) => create(ref as TomeLibraryTomeRef),
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
  AutoDisposeFutureProviderElement<CachedTome> createElement() {
    return _TomeLibraryTomeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TomeLibraryTomeProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TomeLibraryTomeRef on AutoDisposeFutureProviderRef<CachedTome> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TomeLibraryTomeProviderElement
    extends AutoDisposeFutureProviderElement<CachedTome>
    with TomeLibraryTomeRef {
  _TomeLibraryTomeProviderElement(super.provider);

  @override
  String get id => (origin as TomeLibraryTomeProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
