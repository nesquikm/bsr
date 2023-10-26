// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'router_persistence_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RouterPersistenceState _$RouterPersistenceStateFromJson(
    Map<String, dynamic> json) {
  return _RouterPersistenceState.fromJson(json);
}

/// @nodoc
mixin _$RouterPersistenceState {
  String get fullPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouterPersistenceStateCopyWith<RouterPersistenceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouterPersistenceStateCopyWith<$Res> {
  factory $RouterPersistenceStateCopyWith(RouterPersistenceState value,
          $Res Function(RouterPersistenceState) then) =
      _$RouterPersistenceStateCopyWithImpl<$Res, RouterPersistenceState>;
  @useResult
  $Res call({String fullPath});
}

/// @nodoc
class _$RouterPersistenceStateCopyWithImpl<$Res,
        $Val extends RouterPersistenceState>
    implements $RouterPersistenceStateCopyWith<$Res> {
  _$RouterPersistenceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullPath = null,
  }) {
    return _then(_value.copyWith(
      fullPath: null == fullPath
          ? _value.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouterPersistenceStateImplCopyWith<$Res>
    implements $RouterPersistenceStateCopyWith<$Res> {
  factory _$$RouterPersistenceStateImplCopyWith(
          _$RouterPersistenceStateImpl value,
          $Res Function(_$RouterPersistenceStateImpl) then) =
      __$$RouterPersistenceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fullPath});
}

/// @nodoc
class __$$RouterPersistenceStateImplCopyWithImpl<$Res>
    extends _$RouterPersistenceStateCopyWithImpl<$Res,
        _$RouterPersistenceStateImpl>
    implements _$$RouterPersistenceStateImplCopyWith<$Res> {
  __$$RouterPersistenceStateImplCopyWithImpl(
      _$RouterPersistenceStateImpl _value,
      $Res Function(_$RouterPersistenceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullPath = null,
  }) {
    return _then(_$RouterPersistenceStateImpl(
      fullPath: null == fullPath
          ? _value.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouterPersistenceStateImpl implements _RouterPersistenceState {
  const _$RouterPersistenceStateImpl({required this.fullPath});

  factory _$RouterPersistenceStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouterPersistenceStateImplFromJson(json);

  @override
  final String fullPath;

  @override
  String toString() {
    return 'RouterPersistenceState(fullPath: $fullPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouterPersistenceStateImpl &&
            (identical(other.fullPath, fullPath) ||
                other.fullPath == fullPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouterPersistenceStateImplCopyWith<_$RouterPersistenceStateImpl>
      get copyWith => __$$RouterPersistenceStateImplCopyWithImpl<
          _$RouterPersistenceStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouterPersistenceStateImplToJson(
      this,
    );
  }
}

abstract class _RouterPersistenceState implements RouterPersistenceState {
  const factory _RouterPersistenceState({required final String fullPath}) =
      _$RouterPersistenceStateImpl;

  factory _RouterPersistenceState.fromJson(Map<String, dynamic> json) =
      _$RouterPersistenceStateImpl.fromJson;

  @override
  String get fullPath;
  @override
  @JsonKey(ignore: true)
  _$$RouterPersistenceStateImplCopyWith<_$RouterPersistenceStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
