// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tome_library_tome_content.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tomeLibraryTomeContentHash() =>
    r'6672493fcba3726a6360fa0c9a2474dffcb8409c';

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

/// See also [tomeLibraryTomeContent].
@ProviderFor(tomeLibraryTomeContent)
const tomeLibraryTomeContentProvider = TomeLibraryTomeContentFamily();

/// See also [tomeLibraryTomeContent].
class TomeLibraryTomeContentFamily extends Family<AsyncValue<TomeContent>> {
  /// See also [tomeLibraryTomeContent].
  const TomeLibraryTomeContentFamily();

  /// See also [tomeLibraryTomeContent].
  TomeLibraryTomeContentProvider call(
    String id,
  ) {
    return TomeLibraryTomeContentProvider(
      id,
    );
  }

  @override
  TomeLibraryTomeContentProvider getProviderOverride(
    covariant TomeLibraryTomeContentProvider provider,
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
  String? get name => r'tomeLibraryTomeContentProvider';
}

/// See also [tomeLibraryTomeContent].
class TomeLibraryTomeContentProvider
    extends AutoDisposeFutureProvider<TomeContent> {
  /// See also [tomeLibraryTomeContent].
  TomeLibraryTomeContentProvider(
    String id,
  ) : this._internal(
          (ref) => tomeLibraryTomeContent(
            ref as TomeLibraryTomeContentRef,
            id,
          ),
          from: tomeLibraryTomeContentProvider,
          name: r'tomeLibraryTomeContentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tomeLibraryTomeContentHash,
          dependencies: TomeLibraryTomeContentFamily._dependencies,
          allTransitiveDependencies:
              TomeLibraryTomeContentFamily._allTransitiveDependencies,
          id: id,
        );

  TomeLibraryTomeContentProvider._internal(
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
    FutureOr<TomeContent> Function(TomeLibraryTomeContentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TomeLibraryTomeContentProvider._internal(
        (ref) => create(ref as TomeLibraryTomeContentRef),
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
  AutoDisposeFutureProviderElement<TomeContent> createElement() {
    return _TomeLibraryTomeContentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TomeLibraryTomeContentProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TomeLibraryTomeContentRef on AutoDisposeFutureProviderRef<TomeContent> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TomeLibraryTomeContentProviderElement
    extends AutoDisposeFutureProviderElement<TomeContent>
    with TomeLibraryTomeContentRef {
  _TomeLibraryTomeContentProviderElement(super.provider);

  @override
  String get id => (origin as TomeLibraryTomeContentProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
