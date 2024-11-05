// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Token _$TokenFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'uco':
      return UcoToken.fromJson(json);
    case 'withAddress':
      return TokenWithAddress.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Token',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Token {
  String? get name => throw _privateConstructorUsedError;
  int? get decimals => throw _privateConstructorUsedError;
  dynamic get symbol =>
      throw _privateConstructorUsedError; // Unused properties but necessary to union class
  int? get supply => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get properties => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get collection =>
      throw _privateConstructorUsedError;
  List<int>? get aeip => throw _privateConstructorUsedError;
  List<Ownership>? get ownerships => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            int decimals,
            dynamic symbol,
            int? supply,
            String? type,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)
        uco,
    required TResult Function(
            String address,
            String? genesis,
            String? name,
            String? id,
            int? supply,
            String? type,
            int? decimals,
            String? symbol,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)
        withAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            int decimals,
            dynamic symbol,
            int? supply,
            String? type,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        uco,
    TResult? Function(
            String address,
            String? genesis,
            String? name,
            String? id,
            int? supply,
            String? type,
            int? decimals,
            String? symbol,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        withAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            int decimals,
            dynamic symbol,
            int? supply,
            String? type,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        uco,
    TResult Function(
            String address,
            String? genesis,
            String? name,
            String? id,
            int? supply,
            String? type,
            int? decimals,
            String? symbol,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        withAddress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UcoToken value) uco,
    required TResult Function(TokenWithAddress value) withAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UcoToken value)? uco,
    TResult? Function(TokenWithAddress value)? withAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UcoToken value)? uco,
    TResult Function(TokenWithAddress value)? withAddress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this Token to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call(
      {String name,
      int decimals,
      int? supply,
      String? type,
      Map<String, dynamic> properties,
      List<Map<String, dynamic>> collection,
      List<int>? aeip,
      List<Ownership>? ownerships});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? decimals = null,
    Object? supply = freezed,
    Object? type = freezed,
    Object? properties = null,
    Object? collection = null,
    Object? aeip = freezed,
    Object? ownerships = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name!
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: null == decimals
          ? _value.decimals!
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      supply: freezed == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      aeip: freezed == aeip
          ? _value.aeip
          : aeip // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      ownerships: freezed == ownerships
          ? _value.ownerships
          : ownerships // ignore: cast_nullable_to_non_nullable
              as List<Ownership>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UcoTokenImplCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$UcoTokenImplCopyWith(
          _$UcoTokenImpl value, $Res Function(_$UcoTokenImpl) then) =
      __$$UcoTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int decimals,
      dynamic symbol,
      int? supply,
      String? type,
      Map<String, dynamic> properties,
      List<Map<String, dynamic>> collection,
      List<int>? aeip,
      List<Ownership>? ownerships});
}

/// @nodoc
class __$$UcoTokenImplCopyWithImpl<$Res>
    extends _$TokenCopyWithImpl<$Res, _$UcoTokenImpl>
    implements _$$UcoTokenImplCopyWith<$Res> {
  __$$UcoTokenImplCopyWithImpl(
      _$UcoTokenImpl _value, $Res Function(_$UcoTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? decimals = null,
    Object? symbol = freezed,
    Object? supply = freezed,
    Object? type = freezed,
    Object? properties = null,
    Object? collection = null,
    Object? aeip = freezed,
    Object? ownerships = freezed,
  }) {
    return _then(_$UcoTokenImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      symbol: freezed == symbol ? _value.symbol! : symbol,
      supply: freezed == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      collection: null == collection
          ? _value._collection
          : collection // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      aeip: freezed == aeip
          ? _value._aeip
          : aeip // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      ownerships: freezed == ownerships
          ? _value._ownerships
          : ownerships // ignore: cast_nullable_to_non_nullable
              as List<Ownership>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UcoTokenImpl extends UcoToken {
  const _$UcoTokenImpl(
      {this.name = 'Archethic Universal Coin',
      this.decimals = 8,
      this.symbol = 'UCO',
      this.supply = null,
      this.type = null,
      final Map<String, dynamic> properties = const {},
      final List<Map<String, dynamic>> collection = const [],
      final List<int>? aeip = null,
      final List<Ownership>? ownerships = null,
      final String? $type})
      : _properties = properties,
        _collection = collection,
        _aeip = aeip,
        _ownerships = ownerships,
        $type = $type ?? 'uco',
        super._();

  factory _$UcoTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$UcoTokenImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int decimals;
  @override
  @JsonKey()
  final dynamic symbol;
// Unused properties but necessary to union class
  @override
  @JsonKey()
  final int? supply;
  @override
  @JsonKey()
  final String? type;
  final Map<String, dynamic> _properties;
  @override
  @JsonKey()
  Map<String, dynamic> get properties {
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_properties);
  }

  final List<Map<String, dynamic>> _collection;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get collection {
    if (_collection is EqualUnmodifiableListView) return _collection;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collection);
  }

  final List<int>? _aeip;
  @override
  @JsonKey()
  List<int>? get aeip {
    final value = _aeip;
    if (value == null) return null;
    if (_aeip is EqualUnmodifiableListView) return _aeip;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Ownership>? _ownerships;
  @override
  @JsonKey()
  List<Ownership>? get ownerships {
    final value = _ownerships;
    if (value == null) return null;
    if (_ownerships is EqualUnmodifiableListView) return _ownerships;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Token.uco(name: $name, decimals: $decimals, symbol: $symbol, supply: $supply, type: $type, properties: $properties, collection: $collection, aeip: $aeip, ownerships: $ownerships)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UcoTokenImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            (identical(other.supply, supply) || other.supply == supply) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality()
                .equals(other._collection, _collection) &&
            const DeepCollectionEquality().equals(other._aeip, _aeip) &&
            const DeepCollectionEquality()
                .equals(other._ownerships, _ownerships));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      decimals,
      const DeepCollectionEquality().hash(symbol),
      supply,
      type,
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(_collection),
      const DeepCollectionEquality().hash(_aeip),
      const DeepCollectionEquality().hash(_ownerships));

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UcoTokenImplCopyWith<_$UcoTokenImpl> get copyWith =>
      __$$UcoTokenImplCopyWithImpl<_$UcoTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            int decimals,
            dynamic symbol,
            int? supply,
            String? type,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)
        uco,
    required TResult Function(
            String address,
            String? genesis,
            String? name,
            String? id,
            int? supply,
            String? type,
            int? decimals,
            String? symbol,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)
        withAddress,
  }) {
    return uco(name, decimals, symbol, supply, type, properties, collection,
        aeip, ownerships);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            int decimals,
            dynamic symbol,
            int? supply,
            String? type,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        uco,
    TResult? Function(
            String address,
            String? genesis,
            String? name,
            String? id,
            int? supply,
            String? type,
            int? decimals,
            String? symbol,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        withAddress,
  }) {
    return uco?.call(name, decimals, symbol, supply, type, properties,
        collection, aeip, ownerships);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            int decimals,
            dynamic symbol,
            int? supply,
            String? type,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        uco,
    TResult Function(
            String address,
            String? genesis,
            String? name,
            String? id,
            int? supply,
            String? type,
            int? decimals,
            String? symbol,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        withAddress,
    required TResult orElse(),
  }) {
    if (uco != null) {
      return uco(name, decimals, symbol, supply, type, properties, collection,
          aeip, ownerships);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UcoToken value) uco,
    required TResult Function(TokenWithAddress value) withAddress,
  }) {
    return uco(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UcoToken value)? uco,
    TResult? Function(TokenWithAddress value)? withAddress,
  }) {
    return uco?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UcoToken value)? uco,
    TResult Function(TokenWithAddress value)? withAddress,
    required TResult orElse(),
  }) {
    if (uco != null) {
      return uco(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UcoTokenImplToJson(
      this,
    );
  }
}

abstract class UcoToken extends Token {
  const factory UcoToken(
      {final String name,
      final int decimals,
      final dynamic symbol,
      final int? supply,
      final String? type,
      final Map<String, dynamic> properties,
      final List<Map<String, dynamic>> collection,
      final List<int>? aeip,
      final List<Ownership>? ownerships}) = _$UcoTokenImpl;
  const UcoToken._() : super._();

  factory UcoToken.fromJson(Map<String, dynamic> json) =
      _$UcoTokenImpl.fromJson;

  @override
  String get name;
  @override
  int get decimals;
  @override
  dynamic get symbol; // Unused properties but necessary to union class
  @override
  int? get supply;
  @override
  String? get type;
  @override
  Map<String, dynamic> get properties;
  @override
  List<Map<String, dynamic>> get collection;
  @override
  List<int>? get aeip;
  @override
  List<Ownership>? get ownerships;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UcoTokenImplCopyWith<_$UcoTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TokenWithAddressImplCopyWith<$Res>
    implements $TokenCopyWith<$Res> {
  factory _$$TokenWithAddressImplCopyWith(_$TokenWithAddressImpl value,
          $Res Function(_$TokenWithAddressImpl) then) =
      __$$TokenWithAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String? genesis,
      String? name,
      String? id,
      int? supply,
      String? type,
      int? decimals,
      String? symbol,
      Map<String, dynamic> properties,
      List<Map<String, dynamic>> collection,
      List<int>? aeip,
      List<Ownership>? ownerships});
}

/// @nodoc
class __$$TokenWithAddressImplCopyWithImpl<$Res>
    extends _$TokenCopyWithImpl<$Res, _$TokenWithAddressImpl>
    implements _$$TokenWithAddressImplCopyWith<$Res> {
  __$$TokenWithAddressImplCopyWithImpl(_$TokenWithAddressImpl _value,
      $Res Function(_$TokenWithAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? genesis = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? supply = freezed,
    Object? type = freezed,
    Object? decimals = freezed,
    Object? symbol = freezed,
    Object? properties = null,
    Object? collection = null,
    Object? aeip = freezed,
    Object? ownerships = freezed,
  }) {
    return _then(_$TokenWithAddressImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      genesis: freezed == genesis
          ? _value.genesis
          : genesis // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      supply: freezed == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      decimals: freezed == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      collection: null == collection
          ? _value._collection
          : collection // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      aeip: freezed == aeip
          ? _value._aeip
          : aeip // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      ownerships: freezed == ownerships
          ? _value._ownerships
          : ownerships // ignore: cast_nullable_to_non_nullable
              as List<Ownership>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenWithAddressImpl extends TokenWithAddress {
  const _$TokenWithAddressImpl(
      {required this.address,
      this.genesis,
      this.name,
      this.id,
      this.supply,
      this.type,
      this.decimals,
      this.symbol,
      final Map<String, dynamic> properties = const {},
      final List<Map<String, dynamic>> collection = const [],
      final List<int>? aeip = const [],
      final List<Ownership>? ownerships = const [],
      final String? $type})
      : _properties = properties,
        _collection = collection,
        _aeip = aeip,
        _ownerships = ownerships,
        $type = $type ?? 'withAddress',
        super._();

  factory _$TokenWithAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenWithAddressImplFromJson(json);

  @override
  final String address;
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
  final int? decimals;
  @override
  final String? symbol;
  final Map<String, dynamic> _properties;
  @override
  @JsonKey()
  Map<String, dynamic> get properties {
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_properties);
  }

  final List<Map<String, dynamic>> _collection;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get collection {
    if (_collection is EqualUnmodifiableListView) return _collection;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collection);
  }

  final List<int>? _aeip;
  @override
  @JsonKey()
  List<int>? get aeip {
    final value = _aeip;
    if (value == null) return null;
    if (_aeip is EqualUnmodifiableListView) return _aeip;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Ownership>? _ownerships;
  @override
  @JsonKey()
  List<Ownership>? get ownerships {
    final value = _ownerships;
    if (value == null) return null;
    if (_ownerships is EqualUnmodifiableListView) return _ownerships;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Token.withAddress(address: $address, genesis: $genesis, name: $name, id: $id, supply: $supply, type: $type, decimals: $decimals, symbol: $symbol, properties: $properties, collection: $collection, aeip: $aeip, ownerships: $ownerships)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenWithAddressImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.genesis, genesis) || other.genesis == genesis) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.supply, supply) || other.supply == supply) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality()
                .equals(other._collection, _collection) &&
            const DeepCollectionEquality().equals(other._aeip, _aeip) &&
            const DeepCollectionEquality()
                .equals(other._ownerships, _ownerships));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      genesis,
      name,
      id,
      supply,
      type,
      decimals,
      symbol,
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(_collection),
      const DeepCollectionEquality().hash(_aeip),
      const DeepCollectionEquality().hash(_ownerships));

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenWithAddressImplCopyWith<_$TokenWithAddressImpl> get copyWith =>
      __$$TokenWithAddressImplCopyWithImpl<_$TokenWithAddressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            int decimals,
            dynamic symbol,
            int? supply,
            String? type,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)
        uco,
    required TResult Function(
            String address,
            String? genesis,
            String? name,
            String? id,
            int? supply,
            String? type,
            int? decimals,
            String? symbol,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)
        withAddress,
  }) {
    return withAddress(address, genesis, name, id, supply, type, decimals,
        symbol, properties, collection, aeip, ownerships);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            int decimals,
            dynamic symbol,
            int? supply,
            String? type,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        uco,
    TResult? Function(
            String address,
            String? genesis,
            String? name,
            String? id,
            int? supply,
            String? type,
            int? decimals,
            String? symbol,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        withAddress,
  }) {
    return withAddress?.call(address, genesis, name, id, supply, type, decimals,
        symbol, properties, collection, aeip, ownerships);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            int decimals,
            dynamic symbol,
            int? supply,
            String? type,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        uco,
    TResult Function(
            String address,
            String? genesis,
            String? name,
            String? id,
            int? supply,
            String? type,
            int? decimals,
            String? symbol,
            Map<String, dynamic> properties,
            List<Map<String, dynamic>> collection,
            List<int>? aeip,
            List<Ownership>? ownerships)?
        withAddress,
    required TResult orElse(),
  }) {
    if (withAddress != null) {
      return withAddress(address, genesis, name, id, supply, type, decimals,
          symbol, properties, collection, aeip, ownerships);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UcoToken value) uco,
    required TResult Function(TokenWithAddress value) withAddress,
  }) {
    return withAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UcoToken value)? uco,
    TResult? Function(TokenWithAddress value)? withAddress,
  }) {
    return withAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UcoToken value)? uco,
    TResult Function(TokenWithAddress value)? withAddress,
    required TResult orElse(),
  }) {
    if (withAddress != null) {
      return withAddress(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenWithAddressImplToJson(
      this,
    );
  }
}

abstract class TokenWithAddress extends Token {
  const factory TokenWithAddress(
      {required final String address,
      final String? genesis,
      final String? name,
      final String? id,
      final int? supply,
      final String? type,
      final int? decimals,
      final String? symbol,
      final Map<String, dynamic> properties,
      final List<Map<String, dynamic>> collection,
      final List<int>? aeip,
      final List<Ownership>? ownerships}) = _$TokenWithAddressImpl;
  const TokenWithAddress._() : super._();

  factory TokenWithAddress.fromJson(Map<String, dynamic> json) =
      _$TokenWithAddressImpl.fromJson;

  String get address;
  String? get genesis;
  @override
  String? get name;
  String? get id;
  @override
  int? get supply;
  @override
  String? get type;
  @override
  int? get decimals;
  @override
  String? get symbol;
  @override
  Map<String, dynamic> get properties;
  @override
  List<Map<String, dynamic>> get collection;
  @override
  List<int>? get aeip;
  @override
  List<Ownership>? get ownerships;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenWithAddressImplCopyWith<_$TokenWithAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
