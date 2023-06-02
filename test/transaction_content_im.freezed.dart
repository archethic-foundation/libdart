// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_content_im.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionContentIM _$TransactionContentIMFromJson(Map<String, dynamic> json) {
  return _TransactionContentIM.fromJson(json);
}

/// @nodoc
mixin _$TransactionContentIM {
  String get compressionAlgo => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionContentIMCopyWith<TransactionContentIM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionContentIMCopyWith<$Res> {
  factory $TransactionContentIMCopyWith(TransactionContentIM value,
          $Res Function(TransactionContentIM) then) =
      _$TransactionContentIMCopyWithImpl<$Res, TransactionContentIM>;
  @useResult
  $Res call({String compressionAlgo, String message});
}

/// @nodoc
class _$TransactionContentIMCopyWithImpl<$Res,
        $Val extends TransactionContentIM>
    implements $TransactionContentIMCopyWith<$Res> {
  _$TransactionContentIMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compressionAlgo = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      compressionAlgo: null == compressionAlgo
          ? _value.compressionAlgo
          : compressionAlgo // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionContentIMCopyWith<$Res>
    implements $TransactionContentIMCopyWith<$Res> {
  factory _$$_TransactionContentIMCopyWith(_$_TransactionContentIM value,
          $Res Function(_$_TransactionContentIM) then) =
      __$$_TransactionContentIMCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String compressionAlgo, String message});
}

/// @nodoc
class __$$_TransactionContentIMCopyWithImpl<$Res>
    extends _$TransactionContentIMCopyWithImpl<$Res, _$_TransactionContentIM>
    implements _$$_TransactionContentIMCopyWith<$Res> {
  __$$_TransactionContentIMCopyWithImpl(_$_TransactionContentIM _value,
      $Res Function(_$_TransactionContentIM) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compressionAlgo = null,
    Object? message = null,
  }) {
    return _then(_$_TransactionContentIM(
      compressionAlgo: null == compressionAlgo
          ? _value.compressionAlgo
          : compressionAlgo // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionContentIM implements _TransactionContentIM {
  const _$_TransactionContentIM(
      {required this.compressionAlgo, required this.message});

  factory _$_TransactionContentIM.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionContentIMFromJson(json);

  @override
  final String compressionAlgo;
  @override
  final String message;

  @override
  String toString() {
    return 'TransactionContentIM(compressionAlgo: $compressionAlgo, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionContentIM &&
            (identical(other.compressionAlgo, compressionAlgo) ||
                other.compressionAlgo == compressionAlgo) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, compressionAlgo, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionContentIMCopyWith<_$_TransactionContentIM> get copyWith =>
      __$$_TransactionContentIMCopyWithImpl<_$_TransactionContentIM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionContentIMToJson(
      this,
    );
  }
}

abstract class _TransactionContentIM implements TransactionContentIM {
  const factory _TransactionContentIM(
      {required final String compressionAlgo,
      required final String message}) = _$_TransactionContentIM;

  factory _TransactionContentIM.fromJson(Map<String, dynamic> json) =
      _$_TransactionContentIM.fromJson;

  @override
  String get compressionAlgo;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionContentIMCopyWith<_$_TransactionContentIM> get copyWith =>
      throw _privateConstructorUsedError;
}
