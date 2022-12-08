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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CrossValidationStamp _$CrossValidationStampFromJson(Map<String, dynamic> json) {
  return _CrossValidationStamp.fromJson(json);
}

/// @nodoc
mixin _$CrossValidationStamp {
  /// Node: node public key
  String? get nodePublicKey => throw _privateConstructorUsedError;

  /// Signature: signature of the validation stamp
  String? get signature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_CrossValidationStampCopyWith<$Res>
    implements $CrossValidationStampCopyWith<$Res> {
  factory _$$_CrossValidationStampCopyWith(_$_CrossValidationStamp value,
          $Res Function(_$_CrossValidationStamp) then) =
      __$$_CrossValidationStampCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nodePublicKey, String? signature});
}

/// @nodoc
class __$$_CrossValidationStampCopyWithImpl<$Res>
    extends _$CrossValidationStampCopyWithImpl<$Res, _$_CrossValidationStamp>
    implements _$$_CrossValidationStampCopyWith<$Res> {
  __$$_CrossValidationStampCopyWithImpl(_$_CrossValidationStamp _value,
      $Res Function(_$_CrossValidationStamp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodePublicKey = freezed,
    Object? signature = freezed,
  }) {
    return _then(_$_CrossValidationStamp(
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
class _$_CrossValidationStamp extends _CrossValidationStamp {
  const _$_CrossValidationStamp({this.nodePublicKey, this.signature})
      : super._();

  factory _$_CrossValidationStamp.fromJson(Map<String, dynamic> json) =>
      _$$_CrossValidationStampFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CrossValidationStamp &&
            (identical(other.nodePublicKey, nodePublicKey) ||
                other.nodePublicKey == nodePublicKey) &&
            (identical(other.signature, signature) ||
                other.signature == signature));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nodePublicKey, signature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CrossValidationStampCopyWith<_$_CrossValidationStamp> get copyWith =>
      __$$_CrossValidationStampCopyWithImpl<_$_CrossValidationStamp>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CrossValidationStampToJson(
      this,
    );
  }
}

abstract class _CrossValidationStamp extends CrossValidationStamp {
  const factory _CrossValidationStamp(
      {final String? nodePublicKey,
      final String? signature}) = _$_CrossValidationStamp;
  const _CrossValidationStamp._() : super._();

  factory _CrossValidationStamp.fromJson(Map<String, dynamic> json) =
      _$_CrossValidationStamp.fromJson;

  @override

  /// Node: node public key
  String? get nodePublicKey;
  @override

  /// Signature: signature of the validation stamp
  String? get signature;
  @override
  @JsonKey(ignore: true)
  _$$_CrossValidationStampCopyWith<_$_CrossValidationStamp> get copyWith =>
      throw _privateConstructorUsedError;
}
