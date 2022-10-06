// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  String? get address => throw _privateConstructorUsedError;
  String? get genesis => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  int? get supply => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  Map<String, dynamic> get tokenProperties =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res>;
  $Res call(
      {String? address,
      String? genesis,
      String? name,
      String? id,
      int? supply,
      String? type,
      String? symbol,
      Map<String, dynamic> tokenProperties});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res> implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  final Token _value;
  // ignore: unused_field
  final $Res Function(Token) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? genesis = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? supply = freezed,
    Object? type = freezed,
    Object? symbol = freezed,
    Object? tokenProperties = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      genesis: genesis == freezed
          ? _value.genesis
          : genesis // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      supply: supply == freezed
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenProperties: tokenProperties == freezed
          ? _value.tokenProperties
          : tokenProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$_TokenCopyWith(_$_Token value, $Res Function(_$_Token) then) =
      __$$_TokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? address,
      String? genesis,
      String? name,
      String? id,
      int? supply,
      String? type,
      String? symbol,
      Map<String, dynamic> tokenProperties});
}

/// @nodoc
class __$$_TokenCopyWithImpl<$Res> extends _$TokenCopyWithImpl<$Res>
    implements _$$_TokenCopyWith<$Res> {
  __$$_TokenCopyWithImpl(_$_Token _value, $Res Function(_$_Token) _then)
      : super(_value, (v) => _then(v as _$_Token));

  @override
  _$_Token get _value => super._value as _$_Token;

  @override
  $Res call({
    Object? address = freezed,
    Object? genesis = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? supply = freezed,
    Object? type = freezed,
    Object? symbol = freezed,
    Object? tokenProperties = freezed,
  }) {
    return _then(_$_Token(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      genesis: genesis == freezed
          ? _value.genesis
          : genesis // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      supply: supply == freezed
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenProperties: tokenProperties == freezed
          ? _value._tokenProperties
          : tokenProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Token extends _Token {
  const _$_Token(
      {this.address,
      this.genesis,
      this.name,
      this.id,
      this.supply,
      this.type,
      this.symbol,
      final Map<String, dynamic> tokenProperties = const {}})
      : _tokenProperties = tokenProperties,
        super._();

  factory _$_Token.fromJson(Map<String, dynamic> json) =>
      _$$_TokenFromJson(json);

  @override
  final String? address;
  @override
  final String? genesis;
  @override
  final String? name;
  @override
  final String? id;
  @override
  final int? supply;
  @override
  final String? type;
  @override
  final String? symbol;
  final Map<String, dynamic> _tokenProperties;
  @override
  @JsonKey()
  Map<String, dynamic> get tokenProperties {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tokenProperties);
  }

  @override
  String toString() {
    return 'Token(address: $address, genesis: $genesis, name: $name, id: $id, supply: $supply, type: $type, symbol: $symbol, tokenProperties: $tokenProperties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Token &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.genesis, genesis) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.supply, supply) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality()
                .equals(other._tokenProperties, _tokenProperties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(genesis),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(supply),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(_tokenProperties));

  @JsonKey(ignore: true)
  @override
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      __$$_TokenCopyWithImpl<_$_Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenToJson(
      this,
    );
  }
}

abstract class _Token extends Token {
  const factory _Token(
      {final String? address,
      final String? genesis,
      final String? name,
      final String? id,
      final int? supply,
      final String? type,
      final String? symbol,
      final Map<String, dynamic> tokenProperties}) = _$_Token;
  const _Token._() : super._();

  factory _Token.fromJson(Map<String, dynamic> json) = _$_Token.fromJson;

  @override
  String? get address;
  @override
  String? get genesis;
  @override
  String? get name;
  @override
  String? get id;
  @override
  int? get supply;
  @override
  String? get type;
  @override
  String? get symbol;
  @override
  Map<String, dynamic> get tokenProperties;
  @override
  @JsonKey(ignore: true)
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      throw _privateConstructorUsedError;
}
