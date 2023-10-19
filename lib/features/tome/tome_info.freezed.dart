// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tome_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TomeInfo _$TomeInfoFromJson(Map<String, dynamic> json) {
  return _TomeInfo.fromJson(json);
}

/// @nodoc
mixin _$TomeInfo {
  String? get author => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<String>? get authors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TomeInfoCopyWith<TomeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TomeInfoCopyWith<$Res> {
  factory $TomeInfoCopyWith(TomeInfo value, $Res Function(TomeInfo) then) =
      _$TomeInfoCopyWithImpl<$Res, TomeInfo>;
  @useResult
  $Res call({String? author, String? title, List<String>? authors});
}

/// @nodoc
class _$TomeInfoCopyWithImpl<$Res, $Val extends TomeInfo>
    implements $TomeInfoCopyWith<$Res> {
  _$TomeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? title = freezed,
    Object? authors = freezed,
  }) {
    return _then(_value.copyWith(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TomeInfoImplCopyWith<$Res>
    implements $TomeInfoCopyWith<$Res> {
  factory _$$TomeInfoImplCopyWith(
          _$TomeInfoImpl value, $Res Function(_$TomeInfoImpl) then) =
      __$$TomeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? author, String? title, List<String>? authors});
}

/// @nodoc
class __$$TomeInfoImplCopyWithImpl<$Res>
    extends _$TomeInfoCopyWithImpl<$Res, _$TomeInfoImpl>
    implements _$$TomeInfoImplCopyWith<$Res> {
  __$$TomeInfoImplCopyWithImpl(
      _$TomeInfoImpl _value, $Res Function(_$TomeInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? title = freezed,
    Object? authors = freezed,
  }) {
    return _then(_$TomeInfoImpl(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TomeInfoImpl implements _TomeInfo {
  const _$TomeInfoImpl(
      {required this.author,
      required this.title,
      required final List<String>? authors})
      : _authors = authors;

  factory _$TomeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TomeInfoImplFromJson(json);

  @override
  final String? author;
  @override
  final String? title;
  final List<String>? _authors;
  @override
  List<String>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TomeInfo(author: $author, title: $title, authors: $authors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TomeInfoImpl &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._authors, _authors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, author, title,
      const DeepCollectionEquality().hash(_authors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TomeInfoImplCopyWith<_$TomeInfoImpl> get copyWith =>
      __$$TomeInfoImplCopyWithImpl<_$TomeInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TomeInfoImplToJson(
      this,
    );
  }
}

abstract class _TomeInfo implements TomeInfo {
  const factory _TomeInfo(
      {required final String? author,
      required final String? title,
      required final List<String>? authors}) = _$TomeInfoImpl;

  factory _TomeInfo.fromJson(Map<String, dynamic> json) =
      _$TomeInfoImpl.fromJson;

  @override
  String? get author;
  @override
  String? get title;
  @override
  List<String>? get authors;
  @override
  @JsonKey(ignore: true)
  _$$TomeInfoImplCopyWith<_$TomeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
