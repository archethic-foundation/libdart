// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call(
      {String? code,
      String? content,
      List<Ownership> ownerships,
      Ledger? ledger,
      List<String> recipients});

  $LedgerCopyWith<$Res>? get ledger;
}

/// @nodoc
class _$DataCopyWithImpl<$Res> implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  final Data _value;
  // ignore: unused_field
  final $Res Function(Data) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? content = freezed,
    Object? ownerships = freezed,
    Object? ledger = freezed,
    Object? recipients = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerships: ownerships == freezed
          ? _value.ownerships
          : ownerships // ignore: cast_nullable_to_non_nullable
              as List<Ownership>,
      ledger: ledger == freezed
          ? _value.ledger
          : ledger // ignore: cast_nullable_to_non_nullable
              as Ledger?,
      recipients: recipients == freezed
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  $LedgerCopyWith<$Res>? get ledger {
    if (_value.ledger == null) {
      return null;
    }

    return $LedgerCopyWith<$Res>(_value.ledger!, (value) {
      return _then(_value.copyWith(ledger: value));
    });
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? code,
      String? content,
      List<Ownership> ownerships,
      Ledger? ledger,
      List<String> recipients});

  @override
  $LedgerCopyWith<$Res>? get ledger;
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, (v) => _then(v as _$_Data));

  @override
  _$_Data get _value => super._value as _$_Data;

  @override
  $Res call({
    Object? code = freezed,
    Object? content = freezed,
    Object? ownerships = freezed,
    Object? ledger = freezed,
    Object? recipients = freezed,
  }) {
    return _then(_$_Data(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerships: ownerships == freezed
          ? _value.ownerships
          : ownerships // ignore: cast_nullable_to_non_nullable
              as List<Ownership>,
      ledger: ledger == freezed
          ? _value.ledger
          : ledger // ignore: cast_nullable_to_non_nullable
              as Ledger?,
      recipients: recipients == freezed
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data extends _Data {
  const _$_Data(
      {this.code,
      this.content,
      this.ownerships = const [],
      this.ledger,
      this.recipients = const []})
      : super._();

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

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

  @override
  String toString() {
    return 'Data(code: $code, content: $content, ownerships: $ownerships, ledger: $ledger, recipients: $recipients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.ownerships, ownerships) &&
            const DeepCollectionEquality().equals(other.ledger, ledger) &&
            const DeepCollectionEquality()
                .equals(other.recipients, recipients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(ownerships),
      const DeepCollectionEquality().hash(ledger),
      const DeepCollectionEquality().hash(recipients));

  @JsonKey(ignore: true)
  @override
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
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
      final List<String> recipients}) = _$_Data;
  const _Data._() : super._();

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

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
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}
