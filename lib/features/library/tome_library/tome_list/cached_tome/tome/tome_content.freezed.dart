// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tome_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TomeContentSection {
  String get html => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TomeContentSectionCopyWith<TomeContentSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TomeContentSectionCopyWith<$Res> {
  factory $TomeContentSectionCopyWith(
          TomeContentSection value, $Res Function(TomeContentSection) then) =
      _$TomeContentSectionCopyWithImpl<$Res, TomeContentSection>;
  @useResult
  $Res call({String html});
}

/// @nodoc
class _$TomeContentSectionCopyWithImpl<$Res, $Val extends TomeContentSection>
    implements $TomeContentSectionCopyWith<$Res> {
  _$TomeContentSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? html = null,
  }) {
    return _then(_value.copyWith(
      html: null == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TomeContentSectionImplCopyWith<$Res>
    implements $TomeContentSectionCopyWith<$Res> {
  factory _$$TomeContentSectionImplCopyWith(_$TomeContentSectionImpl value,
          $Res Function(_$TomeContentSectionImpl) then) =
      __$$TomeContentSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String html});
}

/// @nodoc
class __$$TomeContentSectionImplCopyWithImpl<$Res>
    extends _$TomeContentSectionCopyWithImpl<$Res, _$TomeContentSectionImpl>
    implements _$$TomeContentSectionImplCopyWith<$Res> {
  __$$TomeContentSectionImplCopyWithImpl(_$TomeContentSectionImpl _value,
      $Res Function(_$TomeContentSectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? html = null,
  }) {
    return _then(_$TomeContentSectionImpl(
      html: null == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TomeContentSectionImpl implements _TomeContentSection {
  const _$TomeContentSectionImpl({required this.html});

  @override
  final String html;

  @override
  String toString() {
    return 'TomeContentSection(html: $html)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TomeContentSectionImpl &&
            (identical(other.html, html) || other.html == html));
  }

  @override
  int get hashCode => Object.hash(runtimeType, html);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TomeContentSectionImplCopyWith<_$TomeContentSectionImpl> get copyWith =>
      __$$TomeContentSectionImplCopyWithImpl<_$TomeContentSectionImpl>(
          this, _$identity);
}

abstract class _TomeContentSection implements TomeContentSection {
  const factory _TomeContentSection({required final String html}) =
      _$TomeContentSectionImpl;

  @override
  String get html;
  @override
  @JsonKey(ignore: true)
  _$$TomeContentSectionImplCopyWith<_$TomeContentSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TomeContent {
  List<TomeContentSection> get sections => throw _privateConstructorUsedError;
  Map<String, List<int>> get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TomeContentCopyWith<TomeContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TomeContentCopyWith<$Res> {
  factory $TomeContentCopyWith(
          TomeContent value, $Res Function(TomeContent) then) =
      _$TomeContentCopyWithImpl<$Res, TomeContent>;
  @useResult
  $Res call({List<TomeContentSection> sections, Map<String, List<int>> images});
}

/// @nodoc
class _$TomeContentCopyWithImpl<$Res, $Val extends TomeContent>
    implements $TomeContentCopyWith<$Res> {
  _$TomeContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sections = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<TomeContentSection>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TomeContentImplCopyWith<$Res>
    implements $TomeContentCopyWith<$Res> {
  factory _$$TomeContentImplCopyWith(
          _$TomeContentImpl value, $Res Function(_$TomeContentImpl) then) =
      __$$TomeContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TomeContentSection> sections, Map<String, List<int>> images});
}

/// @nodoc
class __$$TomeContentImplCopyWithImpl<$Res>
    extends _$TomeContentCopyWithImpl<$Res, _$TomeContentImpl>
    implements _$$TomeContentImplCopyWith<$Res> {
  __$$TomeContentImplCopyWithImpl(
      _$TomeContentImpl _value, $Res Function(_$TomeContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sections = null,
    Object? images = null,
  }) {
    return _then(_$TomeContentImpl(
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<TomeContentSection>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
    ));
  }
}

/// @nodoc

class _$TomeContentImpl implements _TomeContent {
  const _$TomeContentImpl(
      {required final List<TomeContentSection> sections,
      required final Map<String, List<int>> images})
      : _sections = sections,
        _images = images;

  final List<TomeContentSection> _sections;
  @override
  List<TomeContentSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  final Map<String, List<int>> _images;
  @override
  Map<String, List<int>> get images {
    if (_images is EqualUnmodifiableMapView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_images);
  }

  @override
  String toString() {
    return 'TomeContent(sections: $sections, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TomeContentImpl &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sections),
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TomeContentImplCopyWith<_$TomeContentImpl> get copyWith =>
      __$$TomeContentImplCopyWithImpl<_$TomeContentImpl>(this, _$identity);
}

abstract class _TomeContent implements TomeContent {
  const factory _TomeContent(
      {required final List<TomeContentSection> sections,
      required final Map<String, List<int>> images}) = _$TomeContentImpl;

  @override
  List<TomeContentSection> get sections;
  @override
  Map<String, List<int>> get images;
  @override
  @JsonKey(ignore: true)
  _$$TomeContentImplCopyWith<_$TomeContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
