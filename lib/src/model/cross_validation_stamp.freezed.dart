// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cross_validation_stamp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CrossValidationStamp _$CrossValidationStampFromJson(Map<String, dynamic> json) {
  return _CrossValidationStamp.fromJson(json);
}

/// @nodoc
mixin _$CrossValidationStamp {
  /// Node: node public key
  String? get nodePublicKey => throw _privateConstructorUsedError;

  /// Signature: signature of the validation stamp
  String? get signature => throw _privateConstructorUsedError;

  /// Serializes this CrossValidationStamp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CrossValidationStamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CrossValidationStampCopyWith<CrossValidationStamp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrossValidationStampCopyWith<$Res> {
  factory $CrossValidationStampCopyWith(CrossValidationStamp value,
          $Res Function(CrossValidationStamp) then) =
      _$CrossValidationStampCopyWithImpl<$Res, CrossValidationStamp>;
  @useResult
  $Res call({String? nodePublicKey, String? signature});
}

/// @nodoc
class _$CrossValidationStampCopyWithImpl<$Res,
        $Val extends CrossValidationStamp>
    implements $CrossValidationStampCopyWith<$Res> {
  _$CrossValidationStampCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CrossValidationStamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodePublicKey = freezed,
    Object? signature = freezed,
  }) {
    return _then(_value.copyWith(
      nodePublicKey: freezed == nodePublicKey
          ? _value.nodePublicKey
          : nodePublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrossValidationStampImplCopyWith<$Res>
    implements $CrossValidationStampCopyWith<$Res> {
  factory _$$CrossValidationStampImplCopyWith(_$CrossValidationStampImpl value,
          $Res Function(_$CrossValidationStampImpl) then) =
      __$$CrossValidationStampImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nodePublicKey, String? signature});
}

/// @nodoc
class __$$CrossValidationStampImplCopyWithImpl<$Res>
    extends _$CrossValidationStampCopyWithImpl<$Res, _$CrossValidationStampImpl>
    implements _$$CrossValidationStampImplCopyWith<$Res> {
  __$$CrossValidationStampImplCopyWithImpl(_$CrossValidationStampImpl _value,
      $Res Function(_$CrossValidationStampImpl) _then)
      : super(_value, _then);

  /// Create a copy of CrossValidationStamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodePublicKey = freezed,
    Object? signature = freezed,
  }) {
    return _then(_$CrossValidationStampImpl(
      nodePublicKey: freezed == nodePublicKey
          ? _value.nodePublicKey
          : nodePublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CrossValidationStampImpl extends _CrossValidationStamp {
  const _$CrossValidationStampImpl({this.nodePublicKey, this.signature})
      : super._();

  factory _$CrossValidationStampImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrossValidationStampImplFromJson(json);

  /// Node: node public key
  @override
  final String? nodePublicKey;

  /// Signature: signature of the validation stamp
  @override
  final String? signature;

  @override
  String toString() {
    return 'CrossValidationStamp(nodePublicKey: $nodePublicKey, signature: $signature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrossValidationStampImpl &&
            (identical(other.nodePublicKey, nodePublicKey) ||
                other.nodePublicKey == nodePublicKey) &&
            (identical(other.signature, signature) ||
                other.signature == signature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nodePublicKey, signature);

  /// Create a copy of CrossValidationStamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrossValidationStampImplCopyWith<_$CrossValidationStampImpl>
      get copyWith =>
          __$$CrossValidationStampImplCopyWithImpl<_$CrossValidationStampImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrossValidationStampImplToJson(
      this,
    );
  }
}

abstract class _CrossValidationStamp extends CrossValidationStamp {
  const factory _CrossValidationStamp(
      {final String? nodePublicKey,
      final String? signature}) = _$CrossValidationStampImpl;
  const _CrossValidationStamp._() : super._();

  factory _CrossValidationStamp.fromJson(Map<String, dynamic> json) =
      _$CrossValidationStampImpl.fromJson;

  /// Node: node public key
  @override
  String? get nodePublicKey;

  /// Signature: signature of the validation stamp
  @override
  String? get signature;

  /// Create a copy of CrossValidationStamp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrossValidationStampImplCopyWith<_$CrossValidationStampImpl>
      get copyWith => throw _privateConstructorUsedError;
}
