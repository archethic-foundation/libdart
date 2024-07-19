// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recipient _$RecipientFromJson(Map<String, dynamic> json) {
  return _Recipient.fromJson(json);
}

/// @nodoc
mixin _$Recipient {
  /// Name of the action
  String? get action => throw _privateConstructorUsedError;

  /// Contract's address
  String? get address => throw _privateConstructorUsedError;

  /// List of arguments for the action (must contain only JSON valid data)
  List<Object>? get args => throw _privateConstructorUsedError;

  /// Serializes this Recipient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipientCopyWith<Recipient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipientCopyWith<$Res> {
  factory $RecipientCopyWith(Recipient value, $Res Function(Recipient) then) =
      _$RecipientCopyWithImpl<$Res, Recipient>;
  @useResult
  $Res call({String? action, String? address, List<Object>? args});
}

/// @nodoc
class _$RecipientCopyWithImpl<$Res, $Val extends Recipient>
    implements $RecipientCopyWith<$Res> {
  _$RecipientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? address = freezed,
    Object? args = freezed,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as List<Object>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipientImplCopyWith<$Res>
    implements $RecipientCopyWith<$Res> {
  factory _$$RecipientImplCopyWith(
          _$RecipientImpl value, $Res Function(_$RecipientImpl) then) =
      __$$RecipientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? action, String? address, List<Object>? args});
}

/// @nodoc
class __$$RecipientImplCopyWithImpl<$Res>
    extends _$RecipientCopyWithImpl<$Res, _$RecipientImpl>
    implements _$$RecipientImplCopyWith<$Res> {
  __$$RecipientImplCopyWithImpl(
      _$RecipientImpl _value, $Res Function(_$RecipientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? address = freezed,
    Object? args = freezed,
  }) {
    return _then(_$RecipientImpl(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      args: freezed == args
          ? _value._args
          : args // ignore: cast_nullable_to_non_nullable
              as List<Object>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipientImpl extends _Recipient {
  const _$RecipientImpl({this.action, this.address, final List<Object>? args})
      : _args = args,
        super._();

  factory _$RecipientImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipientImplFromJson(json);

  /// Name of the action
  @override
  final String? action;

  /// Contract's address
  @override
  final String? address;

  /// List of arguments for the action (must contain only JSON valid data)
  final List<Object>? _args;

  /// List of arguments for the action (must contain only JSON valid data)
  @override
  List<Object>? get args {
    final value = _args;
    if (value == null) return null;
    if (_args is EqualUnmodifiableListView) return _args;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Recipient(action: $action, address: $address, args: $args)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipientImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._args, _args));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, action, address, const DeepCollectionEquality().hash(_args));

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipientImplCopyWith<_$RecipientImpl> get copyWith =>
      __$$RecipientImplCopyWithImpl<_$RecipientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipientImplToJson(
      this,
    );
  }
}

abstract class _Recipient extends Recipient {
  const factory _Recipient(
      {final String? action,
      final String? address,
      final List<Object>? args}) = _$RecipientImpl;
  const _Recipient._() : super._();

  factory _Recipient.fromJson(Map<String, dynamic> json) =
      _$RecipientImpl.fromJson;

  /// Name of the action
  @override
  String? get action;

  /// Contract's address
  @override
  String? get address;

  /// List of arguments for the action (must contain only JSON valid data)
  @override
  List<Object>? get args;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipientImplCopyWith<_$RecipientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
