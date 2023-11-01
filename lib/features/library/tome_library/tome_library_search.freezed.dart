// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tome_library_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TomeLibrarySearchData {
  String get searchText => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) authors,
    required TResult Function(String searchText) titles,
    required TResult Function(String searchText) everywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? authors,
    TResult? Function(String searchText)? titles,
    TResult? Function(String searchText)? everywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? authors,
    TResult Function(String searchText)? titles,
    TResult Function(String searchText)? everywhere,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Authors value) authors,
    required TResult Function(_Titles value) titles,
    required TResult Function(_Everywhere value) everywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Authors value)? authors,
    TResult? Function(_Titles value)? titles,
    TResult? Function(_Everywhere value)? everywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Authors value)? authors,
    TResult Function(_Titles value)? titles,
    TResult Function(_Everywhere value)? everywhere,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TomeLibrarySearchDataCopyWith<TomeLibrarySearchData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TomeLibrarySearchDataCopyWith<$Res> {
  factory $TomeLibrarySearchDataCopyWith(TomeLibrarySearchData value,
          $Res Function(TomeLibrarySearchData) then) =
      _$TomeLibrarySearchDataCopyWithImpl<$Res, TomeLibrarySearchData>;
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class _$TomeLibrarySearchDataCopyWithImpl<$Res,
        $Val extends TomeLibrarySearchData>
    implements $TomeLibrarySearchDataCopyWith<$Res> {
  _$TomeLibrarySearchDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_value.copyWith(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorsImplCopyWith<$Res>
    implements $TomeLibrarySearchDataCopyWith<$Res> {
  factory _$$AuthorsImplCopyWith(
          _$AuthorsImpl value, $Res Function(_$AuthorsImpl) then) =
      __$$AuthorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class __$$AuthorsImplCopyWithImpl<$Res>
    extends _$TomeLibrarySearchDataCopyWithImpl<$Res, _$AuthorsImpl>
    implements _$$AuthorsImplCopyWith<$Res> {
  __$$AuthorsImplCopyWithImpl(
      _$AuthorsImpl _value, $Res Function(_$AuthorsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$AuthorsImpl(
      null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthorsImpl implements _Authors {
  const _$AuthorsImpl(this.searchText);

  @override
  final String searchText;

  @override
  String toString() {
    return 'TomeLibrarySearchData.authors(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorsImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorsImplCopyWith<_$AuthorsImpl> get copyWith =>
      __$$AuthorsImplCopyWithImpl<_$AuthorsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) authors,
    required TResult Function(String searchText) titles,
    required TResult Function(String searchText) everywhere,
  }) {
    return authors(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? authors,
    TResult? Function(String searchText)? titles,
    TResult? Function(String searchText)? everywhere,
  }) {
    return authors?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? authors,
    TResult Function(String searchText)? titles,
    TResult Function(String searchText)? everywhere,
    required TResult orElse(),
  }) {
    if (authors != null) {
      return authors(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Authors value) authors,
    required TResult Function(_Titles value) titles,
    required TResult Function(_Everywhere value) everywhere,
  }) {
    return authors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Authors value)? authors,
    TResult? Function(_Titles value)? titles,
    TResult? Function(_Everywhere value)? everywhere,
  }) {
    return authors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Authors value)? authors,
    TResult Function(_Titles value)? titles,
    TResult Function(_Everywhere value)? everywhere,
    required TResult orElse(),
  }) {
    if (authors != null) {
      return authors(this);
    }
    return orElse();
  }
}

abstract class _Authors implements TomeLibrarySearchData {
  const factory _Authors(final String searchText) = _$AuthorsImpl;

  @override
  String get searchText;
  @override
  @JsonKey(ignore: true)
  _$$AuthorsImplCopyWith<_$AuthorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TitlesImplCopyWith<$Res>
    implements $TomeLibrarySearchDataCopyWith<$Res> {
  factory _$$TitlesImplCopyWith(
          _$TitlesImpl value, $Res Function(_$TitlesImpl) then) =
      __$$TitlesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class __$$TitlesImplCopyWithImpl<$Res>
    extends _$TomeLibrarySearchDataCopyWithImpl<$Res, _$TitlesImpl>
    implements _$$TitlesImplCopyWith<$Res> {
  __$$TitlesImplCopyWithImpl(
      _$TitlesImpl _value, $Res Function(_$TitlesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$TitlesImpl(
      null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TitlesImpl implements _Titles {
  const _$TitlesImpl(this.searchText);

  @override
  final String searchText;

  @override
  String toString() {
    return 'TomeLibrarySearchData.titles(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TitlesImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TitlesImplCopyWith<_$TitlesImpl> get copyWith =>
      __$$TitlesImplCopyWithImpl<_$TitlesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) authors,
    required TResult Function(String searchText) titles,
    required TResult Function(String searchText) everywhere,
  }) {
    return titles(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? authors,
    TResult? Function(String searchText)? titles,
    TResult? Function(String searchText)? everywhere,
  }) {
    return titles?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? authors,
    TResult Function(String searchText)? titles,
    TResult Function(String searchText)? everywhere,
    required TResult orElse(),
  }) {
    if (titles != null) {
      return titles(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Authors value) authors,
    required TResult Function(_Titles value) titles,
    required TResult Function(_Everywhere value) everywhere,
  }) {
    return titles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Authors value)? authors,
    TResult? Function(_Titles value)? titles,
    TResult? Function(_Everywhere value)? everywhere,
  }) {
    return titles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Authors value)? authors,
    TResult Function(_Titles value)? titles,
    TResult Function(_Everywhere value)? everywhere,
    required TResult orElse(),
  }) {
    if (titles != null) {
      return titles(this);
    }
    return orElse();
  }
}

abstract class _Titles implements TomeLibrarySearchData {
  const factory _Titles(final String searchText) = _$TitlesImpl;

  @override
  String get searchText;
  @override
  @JsonKey(ignore: true)
  _$$TitlesImplCopyWith<_$TitlesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EverywhereImplCopyWith<$Res>
    implements $TomeLibrarySearchDataCopyWith<$Res> {
  factory _$$EverywhereImplCopyWith(
          _$EverywhereImpl value, $Res Function(_$EverywhereImpl) then) =
      __$$EverywhereImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class __$$EverywhereImplCopyWithImpl<$Res>
    extends _$TomeLibrarySearchDataCopyWithImpl<$Res, _$EverywhereImpl>
    implements _$$EverywhereImplCopyWith<$Res> {
  __$$EverywhereImplCopyWithImpl(
      _$EverywhereImpl _value, $Res Function(_$EverywhereImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$EverywhereImpl(
      null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EverywhereImpl implements _Everywhere {
  const _$EverywhereImpl(this.searchText);

  @override
  final String searchText;

  @override
  String toString() {
    return 'TomeLibrarySearchData.everywhere(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EverywhereImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EverywhereImplCopyWith<_$EverywhereImpl> get copyWith =>
      __$$EverywhereImplCopyWithImpl<_$EverywhereImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) authors,
    required TResult Function(String searchText) titles,
    required TResult Function(String searchText) everywhere,
  }) {
    return everywhere(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? authors,
    TResult? Function(String searchText)? titles,
    TResult? Function(String searchText)? everywhere,
  }) {
    return everywhere?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? authors,
    TResult Function(String searchText)? titles,
    TResult Function(String searchText)? everywhere,
    required TResult orElse(),
  }) {
    if (everywhere != null) {
      return everywhere(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Authors value) authors,
    required TResult Function(_Titles value) titles,
    required TResult Function(_Everywhere value) everywhere,
  }) {
    return everywhere(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Authors value)? authors,
    TResult? Function(_Titles value)? titles,
    TResult? Function(_Everywhere value)? everywhere,
  }) {
    return everywhere?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Authors value)? authors,
    TResult Function(_Titles value)? titles,
    TResult Function(_Everywhere value)? everywhere,
    required TResult orElse(),
  }) {
    if (everywhere != null) {
      return everywhere(this);
    }
    return orElse();
  }
}

abstract class _Everywhere implements TomeLibrarySearchData {
  const factory _Everywhere(final String searchText) = _$EverywhereImpl;

  @override
  String get searchText;
  @override
  @JsonKey(ignore: true)
  _$$EverywhereImplCopyWith<_$EverywhereImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
