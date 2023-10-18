// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  /// Code: smart contract code (hexadecimal),
  String? get code => throw _privateConstructorUsedError;

  /// Content: free zone for data hosting (string or hexadecimal)
  String? get content => throw _privateConstructorUsedError;

  /// Ownership: authorization/delegations containing list of secrets and their authorized public keys to proof the ownership
  List<Ownership> get ownerships => throw _privateConstructorUsedError;

  /// Ledger: asset transfers
  Ledger? get ledger => throw _privateConstructorUsedError;

  /// Recipients: For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
  List<String> get recipients => throw _privateConstructorUsedError;

  /// Recipients: For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
  List<Recipient> get actionRecipients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {String? code,
      String? content,
      List<Ownership> ownerships,
      Ledger? ledger,
      List<String> recipients,
      List<Recipient> actionRecipients});

  $LedgerCopyWith<$Res>? get ledger;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? content = freezed,
    Object? ownerships = null,
    Object? ledger = freezed,
    Object? recipients = null,
    Object? actionRecipients = null,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerships: null == ownerships
          ? _value.ownerships
          : ownerships // ignore: cast_nullable_to_non_nullable
              as List<Ownership>,
      ledger: freezed == ledger
          ? _value.ledger
          : ledger // ignore: cast_nullable_to_non_nullable
              as Ledger?,
      recipients: null == recipients
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      actionRecipients: null == actionRecipients
          ? _value.actionRecipients
          : actionRecipients // ignore: cast_nullable_to_non_nullable
              as List<Recipient>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LedgerCopyWith<$Res>? get ledger {
    if (_value.ledger == null) {
      return null;
    }

    return $LedgerCopyWith<$Res>(_value.ledger!, (value) {
      return _then(_value.copyWith(ledger: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      String? content,
      List<Ownership> ownerships,
      Ledger? ledger,
      List<String> recipients,
      List<Recipient> actionRecipients});

  @override
  $LedgerCopyWith<$Res>? get ledger;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? content = freezed,
    Object? ownerships = null,
    Object? ledger = freezed,
    Object? recipients = null,
    Object? actionRecipients = null,
  }) {
    return _then(_$DataImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerships: null == ownerships
          ? _value.ownerships
          : ownerships // ignore: cast_nullable_to_non_nullable
              as List<Ownership>,
      ledger: freezed == ledger
          ? _value.ledger
          : ledger // ignore: cast_nullable_to_non_nullable
              as Ledger?,
      recipients: null == recipients
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      actionRecipients: null == actionRecipients
          ? _value.actionRecipients
          : actionRecipients // ignore: cast_nullable_to_non_nullable
              as List<Recipient>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl extends _Data {
  const _$DataImpl(
      {this.code,
      this.content,
      this.ownerships = const [],
      this.ledger,
      this.recipients = const [],
      this.actionRecipients = const []})
      : super._();

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  /// Code: smart contract code (hexadecimal),
  @override
  final String? code;

  /// Content: free zone for data hosting (string or hexadecimal)
  @override
  final String? content;

  /// Ownership: authorization/delegations containing list of secrets and their authorized public keys to proof the ownership
  @override
  @JsonKey()
  final List<Ownership> ownerships;

  /// Ledger: asset transfers
  @override
  final Ledger? ledger;

  /// Recipients: For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
  @override
  @JsonKey()
  final List<String> recipients;

  /// Recipients: For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
  @override
  @JsonKey()
  final List<Recipient> actionRecipients;

  @override
  String toString() {
    return 'Data(code: $code, content: $content, ownerships: $ownerships, ledger: $ledger, recipients: $recipients, actionRecipients: $actionRecipients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other.ownerships, ownerships) &&
            (identical(other.ledger, ledger) || other.ledger == ledger) &&
            const DeepCollectionEquality()
                .equals(other.recipients, recipients) &&
            const DeepCollectionEquality()
                .equals(other.actionRecipients, actionRecipients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      content,
      const DeepCollectionEquality().hash(ownerships),
      ledger,
      const DeepCollectionEquality().hash(recipients),
      const DeepCollectionEquality().hash(actionRecipients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data extends Data {
  const factory _Data(
      {final String? code,
      final String? content,
      final List<Ownership> ownerships,
      final Ledger? ledger,
      final List<String> recipients,
      final List<Recipient> actionRecipients}) = _$DataImpl;
  const _Data._() : super._();

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override

  /// Code: smart contract code (hexadecimal),
  String? get code;
  @override

  /// Content: free zone for data hosting (string or hexadecimal)
  String? get content;
  @override

  /// Ownership: authorization/delegations containing list of secrets and their authorized public keys to proof the ownership
  List<Ownership> get ownerships;
  @override

  /// Ledger: asset transfers
  Ledger? get ledger;
  @override

  /// Recipients: For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
  List<String> get recipients;
  @override

  /// Recipients: For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
  List<Recipient> get actionRecipients;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
