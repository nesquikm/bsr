// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tome_library_search_index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TomeLibrarySearchIndexData {
  Map<String, Set<String>> get authorWords =>
      throw _privateConstructorUsedError;
  Map<String, Set<String>> get titleWords => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TomeLibrarySearchIndexDataCopyWith<TomeLibrarySearchIndexData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TomeLibrarySearchIndexDataCopyWith<$Res> {
  factory $TomeLibrarySearchIndexDataCopyWith(TomeLibrarySearchIndexData value,
          $Res Function(TomeLibrarySearchIndexData) then) =
      _$TomeLibrarySearchIndexDataCopyWithImpl<$Res,
          TomeLibrarySearchIndexData>;
  @useResult
  $Res call(
      {Map<String, Set<String>> authorWords,
      Map<String, Set<String>> titleWords});
}

/// @nodoc
class _$TomeLibrarySearchIndexDataCopyWithImpl<$Res,
        $Val extends TomeLibrarySearchIndexData>
    implements $TomeLibrarySearchIndexDataCopyWith<$Res> {
  _$TomeLibrarySearchIndexDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorWords = null,
    Object? titleWords = null,
  }) {
    return _then(_value.copyWith(
      authorWords: null == authorWords
          ? _value.authorWords
          : authorWords // ignore: cast_nullable_to_non_nullable
              as Map<String, Set<String>>,
      titleWords: null == titleWords
          ? _value.titleWords
          : titleWords // ignore: cast_nullable_to_non_nullable
              as Map<String, Set<String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TomeLibrarySearchIndexDataImplCopyWith<$Res>
    implements $TomeLibrarySearchIndexDataCopyWith<$Res> {
  factory _$$TomeLibrarySearchIndexDataImplCopyWith(
          _$TomeLibrarySearchIndexDataImpl value,
          $Res Function(_$TomeLibrarySearchIndexDataImpl) then) =
      __$$TomeLibrarySearchIndexDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, Set<String>> authorWords,
      Map<String, Set<String>> titleWords});
}

/// @nodoc
class __$$TomeLibrarySearchIndexDataImplCopyWithImpl<$Res>
    extends _$TomeLibrarySearchIndexDataCopyWithImpl<$Res,
        _$TomeLibrarySearchIndexDataImpl>
    implements _$$TomeLibrarySearchIndexDataImplCopyWith<$Res> {
  __$$TomeLibrarySearchIndexDataImplCopyWithImpl(
      _$TomeLibrarySearchIndexDataImpl _value,
      $Res Function(_$TomeLibrarySearchIndexDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorWords = null,
    Object? titleWords = null,
  }) {
    return _then(_$TomeLibrarySearchIndexDataImpl(
      authorWords: null == authorWords
          ? _value._authorWords
          : authorWords // ignore: cast_nullable_to_non_nullable
              as Map<String, Set<String>>,
      titleWords: null == titleWords
          ? _value._titleWords
          : titleWords // ignore: cast_nullable_to_non_nullable
              as Map<String, Set<String>>,
    ));
  }
}

/// @nodoc

class _$TomeLibrarySearchIndexDataImpl implements _TomeLibrarySearchIndexData {
  const _$TomeLibrarySearchIndexDataImpl(
      {required final Map<String, Set<String>> authorWords,
      required final Map<String, Set<String>> titleWords})
      : _authorWords = authorWords,
        _titleWords = titleWords;

  final Map<String, Set<String>> _authorWords;
  @override
  Map<String, Set<String>> get authorWords {
    if (_authorWords is EqualUnmodifiableMapView) return _authorWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_authorWords);
  }

  final Map<String, Set<String>> _titleWords;
  @override
  Map<String, Set<String>> get titleWords {
    if (_titleWords is EqualUnmodifiableMapView) return _titleWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_titleWords);
  }

  @override
  String toString() {
    return 'TomeLibrarySearchIndexData(authorWords: $authorWords, titleWords: $titleWords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TomeLibrarySearchIndexDataImpl &&
            const DeepCollectionEquality()
                .equals(other._authorWords, _authorWords) &&
            const DeepCollectionEquality()
                .equals(other._titleWords, _titleWords));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_authorWords),
      const DeepCollectionEquality().hash(_titleWords));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TomeLibrarySearchIndexDataImplCopyWith<_$TomeLibrarySearchIndexDataImpl>
      get copyWith => __$$TomeLibrarySearchIndexDataImplCopyWithImpl<
          _$TomeLibrarySearchIndexDataImpl>(this, _$identity);
}

abstract class _TomeLibrarySearchIndexData
    implements TomeLibrarySearchIndexData {
  const factory _TomeLibrarySearchIndexData(
          {required final Map<String, Set<String>> authorWords,
          required final Map<String, Set<String>> titleWords}) =
      _$TomeLibrarySearchIndexDataImpl;

  @override
  Map<String, Set<String>> get authorWords;
  @override
  Map<String, Set<String>> get titleWords;
  @override
  @JsonKey(ignore: true)
  _$$TomeLibrarySearchIndexDataImplCopyWith<_$TomeLibrarySearchIndexDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
