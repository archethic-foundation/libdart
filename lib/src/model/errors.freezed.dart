// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Errors _$ErrorsFromJson(Map<String, dynamic> json) {
  return _Errors.fromJson(json);
}

/// @nodoc
mixin _$Errors {
  List<Error> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorsCopyWith<Errors> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorsCopyWith<$Res> {
  factory $ErrorsCopyWith(Errors value, $Res Function(Errors) then) =
      _$ErrorsCopyWithImpl<$Res>;
  $Res call({List<Error> errors});
}

/// @nodoc
class _$ErrorsCopyWithImpl<$Res> implements $ErrorsCopyWith<$Res> {
  _$ErrorsCopyWithImpl(this._value, this._then);

  final Errors _value;
  // ignore: unused_field
  final $Res Function(Errors) _then;

  @override
  $Res call({
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<Error>,
    ));
  }
}

/// @nodoc
abstract class _$$_ErrorsCopyWith<$Res> implements $ErrorsCopyWith<$Res> {
  factory _$$_ErrorsCopyWith(_$_Errors value, $Res Function(_$_Errors) then) =
      __$$_ErrorsCopyWithImpl<$Res>;
  @override
  $Res call({List<Error> errors});
}

/// @nodoc
class __$$_ErrorsCopyWithImpl<$Res> extends _$ErrorsCopyWithImpl<$Res>
    implements _$$_ErrorsCopyWith<$Res> {
  __$$_ErrorsCopyWithImpl(_$_Errors _value, $Res Function(_$_Errors) _then)
      : super(_value, (v) => _then(v as _$_Errors));

  @override
  _$_Errors get _value => super._value as _$_Errors;

  @override
  $Res call({
    Object? errors = freezed,
  }) {
    return _then(_$_Errors(
      errors: errors == freezed
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<Error>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Errors extends _Errors {
  const _$_Errors({final List<Error> errors = const []})
      : _errors = errors,
        super._();

  factory _$_Errors.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorsFromJson(json);

  final List<Error> _errors;
  @override
  @JsonKey()
  List<Error> get errors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'Errors(errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Errors &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorsCopyWith<_$_Errors> get copyWith =>
      __$$_ErrorsCopyWithImpl<_$_Errors>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorsToJson(
      this,
    );
  }
}

abstract class _Errors extends Errors {
  const factory _Errors({final List<Error> errors}) = _$_Errors;
  const _Errors._() : super._();

  factory _Errors.fromJson(Map<String, dynamic> json) = _$_Errors.fromJson;

  @override
  List<Error> get errors;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorsCopyWith<_$_Errors> get copyWith =>
      throw _privateConstructorUsedError;
}
