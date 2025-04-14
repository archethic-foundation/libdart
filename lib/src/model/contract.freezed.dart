// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContractManifest _$ContractManifestFromJson(Map<String, dynamic> json) {
  return _ContractManifest.fromJson(json);
}

/// @nodoc
mixin _$ContractManifest {
  WasmABI get abi => throw _privateConstructorUsedError;

  /// Serializes this ContractManifest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContractManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContractManifestCopyWith<ContractManifest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractManifestCopyWith<$Res> {
  factory $ContractManifestCopyWith(
          ContractManifest value, $Res Function(ContractManifest) then) =
      _$ContractManifestCopyWithImpl<$Res, ContractManifest>;
  @useResult
  $Res call({WasmABI abi});

  $WasmABICopyWith<$Res> get abi;
}

/// @nodoc
class _$ContractManifestCopyWithImpl<$Res, $Val extends ContractManifest>
    implements $ContractManifestCopyWith<$Res> {
  _$ContractManifestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContractManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? abi = null,
  }) {
    return _then(_value.copyWith(
      abi: null == abi
          ? _value.abi
          : abi // ignore: cast_nullable_to_non_nullable
              as WasmABI,
    ) as $Val);
  }

  /// Create a copy of ContractManifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WasmABICopyWith<$Res> get abi {
    return $WasmABICopyWith<$Res>(_value.abi, (value) {
      return _then(_value.copyWith(abi: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContractManifestImplCopyWith<$Res>
    implements $ContractManifestCopyWith<$Res> {
  factory _$$ContractManifestImplCopyWith(_$ContractManifestImpl value,
          $Res Function(_$ContractManifestImpl) then) =
      __$$ContractManifestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WasmABI abi});

  @override
  $WasmABICopyWith<$Res> get abi;
}

/// @nodoc
class __$$ContractManifestImplCopyWithImpl<$Res>
    extends _$ContractManifestCopyWithImpl<$Res, _$ContractManifestImpl>
    implements _$$ContractManifestImplCopyWith<$Res> {
  __$$ContractManifestImplCopyWithImpl(_$ContractManifestImpl _value,
      $Res Function(_$ContractManifestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContractManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? abi = null,
  }) {
    return _then(_$ContractManifestImpl(
      abi: null == abi
          ? _value.abi
          : abi // ignore: cast_nullable_to_non_nullable
              as WasmABI,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContractManifestImpl implements _ContractManifest {
  const _$ContractManifestImpl({required this.abi});

  factory _$ContractManifestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContractManifestImplFromJson(json);

  @override
  final WasmABI abi;

  @override
  String toString() {
    return 'ContractManifest(abi: $abi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractManifestImpl &&
            (identical(other.abi, abi) || other.abi == abi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, abi);

  /// Create a copy of ContractManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractManifestImplCopyWith<_$ContractManifestImpl> get copyWith =>
      __$$ContractManifestImplCopyWithImpl<_$ContractManifestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractManifestImplToJson(
      this,
    );
  }
}

abstract class _ContractManifest implements ContractManifest {
  const factory _ContractManifest({required final WasmABI abi}) =
      _$ContractManifestImpl;

  factory _ContractManifest.fromJson(Map<String, dynamic> json) =
      _$ContractManifestImpl.fromJson;

  @override
  WasmABI get abi;

  /// Create a copy of ContractManifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContractManifestImplCopyWith<_$ContractManifestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WasmABI _$WasmABIFromJson(Map<String, dynamic> json) {
  return _WasmABI.fromJson(json);
}

/// @nodoc
mixin _$WasmABI {
  Map<String, String> get state => throw _privateConstructorUsedError;
  Map<String, WASMFunctionABI> get functions =>
      throw _privateConstructorUsedError;

  /// Serializes this WasmABI to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WasmABI
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WasmABICopyWith<WasmABI> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WasmABICopyWith<$Res> {
  factory $WasmABICopyWith(WasmABI value, $Res Function(WasmABI) then) =
      _$WasmABICopyWithImpl<$Res, WasmABI>;
  @useResult
  $Res call(
      {Map<String, String> state, Map<String, WASMFunctionABI> functions});
}

/// @nodoc
class _$WasmABICopyWithImpl<$Res, $Val extends WasmABI>
    implements $WasmABICopyWith<$Res> {
  _$WasmABICopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WasmABI
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? functions = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      functions: null == functions
          ? _value.functions
          : functions // ignore: cast_nullable_to_non_nullable
              as Map<String, WASMFunctionABI>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WasmABIImplCopyWith<$Res> implements $WasmABICopyWith<$Res> {
  factory _$$WasmABIImplCopyWith(
          _$WasmABIImpl value, $Res Function(_$WasmABIImpl) then) =
      __$$WasmABIImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, String> state, Map<String, WASMFunctionABI> functions});
}

/// @nodoc
class __$$WasmABIImplCopyWithImpl<$Res>
    extends _$WasmABICopyWithImpl<$Res, _$WasmABIImpl>
    implements _$$WasmABIImplCopyWith<$Res> {
  __$$WasmABIImplCopyWithImpl(
      _$WasmABIImpl _value, $Res Function(_$WasmABIImpl) _then)
      : super(_value, _then);

  /// Create a copy of WasmABI
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? functions = null,
  }) {
    return _then(_$WasmABIImpl(
      state: null == state
          ? _value._state
          : state // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      functions: null == functions
          ? _value._functions
          : functions // ignore: cast_nullable_to_non_nullable
              as Map<String, WASMFunctionABI>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WasmABIImpl implements _WasmABI {
  const _$WasmABIImpl(
      {required final Map<String, String> state,
      required final Map<String, WASMFunctionABI> functions})
      : _state = state,
        _functions = functions;

  factory _$WasmABIImpl.fromJson(Map<String, dynamic> json) =>
      _$$WasmABIImplFromJson(json);

  final Map<String, String> _state;
  @override
  Map<String, String> get state {
    if (_state is EqualUnmodifiableMapView) return _state;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_state);
  }

  final Map<String, WASMFunctionABI> _functions;
  @override
  Map<String, WASMFunctionABI> get functions {
    if (_functions is EqualUnmodifiableMapView) return _functions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_functions);
  }

  @override
  String toString() {
    return 'WasmABI(state: $state, functions: $functions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WasmABIImpl &&
            const DeepCollectionEquality().equals(other._state, _state) &&
            const DeepCollectionEquality()
                .equals(other._functions, _functions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_state),
      const DeepCollectionEquality().hash(_functions));

  /// Create a copy of WasmABI
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WasmABIImplCopyWith<_$WasmABIImpl> get copyWith =>
      __$$WasmABIImplCopyWithImpl<_$WasmABIImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WasmABIImplToJson(
      this,
    );
  }
}

abstract class _WasmABI implements WasmABI {
  const factory _WasmABI(
      {required final Map<String, String> state,
      required final Map<String, WASMFunctionABI> functions}) = _$WasmABIImpl;

  factory _WasmABI.fromJson(Map<String, dynamic> json) = _$WasmABIImpl.fromJson;

  @override
  Map<String, String> get state;
  @override
  Map<String, WASMFunctionABI> get functions;

  /// Create a copy of WasmABI
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WasmABIImplCopyWith<_$WasmABIImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WASMFunctionABI _$WASMFunctionABIFromJson(Map<String, dynamic> json) {
  return _WASMFunctionABI.fromJson(json);
}

/// @nodoc
mixin _$WASMFunctionABI {
  String get type => throw _privateConstructorUsedError;
  String? get triggerType => throw _privateConstructorUsedError;
  Map<String, dynamic> get input => throw _privateConstructorUsedError;

  /// Serializes this WASMFunctionABI to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WASMFunctionABI
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WASMFunctionABICopyWith<WASMFunctionABI> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WASMFunctionABICopyWith<$Res> {
  factory $WASMFunctionABICopyWith(
          WASMFunctionABI value, $Res Function(WASMFunctionABI) then) =
      _$WASMFunctionABICopyWithImpl<$Res, WASMFunctionABI>;
  @useResult
  $Res call({String type, String? triggerType, Map<String, dynamic> input});
}

/// @nodoc
class _$WASMFunctionABICopyWithImpl<$Res, $Val extends WASMFunctionABI>
    implements $WASMFunctionABICopyWith<$Res> {
  _$WASMFunctionABICopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WASMFunctionABI
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? triggerType = freezed,
    Object? input = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      triggerType: freezed == triggerType
          ? _value.triggerType
          : triggerType // ignore: cast_nullable_to_non_nullable
              as String?,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WASMFunctionABIImplCopyWith<$Res>
    implements $WASMFunctionABICopyWith<$Res> {
  factory _$$WASMFunctionABIImplCopyWith(_$WASMFunctionABIImpl value,
          $Res Function(_$WASMFunctionABIImpl) then) =
      __$$WASMFunctionABIImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String? triggerType, Map<String, dynamic> input});
}

/// @nodoc
class __$$WASMFunctionABIImplCopyWithImpl<$Res>
    extends _$WASMFunctionABICopyWithImpl<$Res, _$WASMFunctionABIImpl>
    implements _$$WASMFunctionABIImplCopyWith<$Res> {
  __$$WASMFunctionABIImplCopyWithImpl(
      _$WASMFunctionABIImpl _value, $Res Function(_$WASMFunctionABIImpl) _then)
      : super(_value, _then);

  /// Create a copy of WASMFunctionABI
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? triggerType = freezed,
    Object? input = null,
  }) {
    return _then(_$WASMFunctionABIImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      triggerType: freezed == triggerType
          ? _value.triggerType
          : triggerType // ignore: cast_nullable_to_non_nullable
              as String?,
      input: null == input
          ? _value._input
          : input // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WASMFunctionABIImpl implements _WASMFunctionABI {
  const _$WASMFunctionABIImpl(
      {required this.type,
      this.triggerType,
      required final Map<String, dynamic> input})
      : _input = input;

  factory _$WASMFunctionABIImpl.fromJson(Map<String, dynamic> json) =>
      _$$WASMFunctionABIImplFromJson(json);

  @override
  final String type;
  @override
  final String? triggerType;
  final Map<String, dynamic> _input;
  @override
  Map<String, dynamic> get input {
    if (_input is EqualUnmodifiableMapView) return _input;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_input);
  }

  @override
  String toString() {
    return 'WASMFunctionABI(type: $type, triggerType: $triggerType, input: $input)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WASMFunctionABIImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.triggerType, triggerType) ||
                other.triggerType == triggerType) &&
            const DeepCollectionEquality().equals(other._input, _input));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, triggerType,
      const DeepCollectionEquality().hash(_input));

  /// Create a copy of WASMFunctionABI
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WASMFunctionABIImplCopyWith<_$WASMFunctionABIImpl> get copyWith =>
      __$$WASMFunctionABIImplCopyWithImpl<_$WASMFunctionABIImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WASMFunctionABIImplToJson(
      this,
    );
  }
}

abstract class _WASMFunctionABI implements WASMFunctionABI {
  const factory _WASMFunctionABI(
      {required final String type,
      final String? triggerType,
      required final Map<String, dynamic> input}) = _$WASMFunctionABIImpl;

  factory _WASMFunctionABI.fromJson(Map<String, dynamic> json) =
      _$WASMFunctionABIImpl.fromJson;

  @override
  String get type;
  @override
  String? get triggerType;
  @override
  Map<String, dynamic> get input;

  /// Create a copy of WASMFunctionABI
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WASMFunctionABIImplCopyWith<_$WASMFunctionABIImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContractAction _$ContractActionFromJson(Map<String, dynamic> json) {
  return _ContractAction.fromJson(json);
}

/// @nodoc
mixin _$ContractAction {
  String get name => throw _privateConstructorUsedError;
  List<String> get parameters => throw _privateConstructorUsedError;

  /// Serializes this ContractAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContractAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContractActionCopyWith<ContractAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractActionCopyWith<$Res> {
  factory $ContractActionCopyWith(
          ContractAction value, $Res Function(ContractAction) then) =
      _$ContractActionCopyWithImpl<$Res, ContractAction>;
  @useResult
  $Res call({String name, List<String> parameters});
}

/// @nodoc
class _$ContractActionCopyWithImpl<$Res, $Val extends ContractAction>
    implements $ContractActionCopyWith<$Res> {
  _$ContractActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContractAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? parameters = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parameters: null == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContractActionImplCopyWith<$Res>
    implements $ContractActionCopyWith<$Res> {
  factory _$$ContractActionImplCopyWith(_$ContractActionImpl value,
          $Res Function(_$ContractActionImpl) then) =
      __$$ContractActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<String> parameters});
}

/// @nodoc
class __$$ContractActionImplCopyWithImpl<$Res>
    extends _$ContractActionCopyWithImpl<$Res, _$ContractActionImpl>
    implements _$$ContractActionImplCopyWith<$Res> {
  __$$ContractActionImplCopyWithImpl(
      _$ContractActionImpl _value, $Res Function(_$ContractActionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContractAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? parameters = null,
  }) {
    return _then(_$ContractActionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parameters: null == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContractActionImpl implements _ContractAction {
  const _$ContractActionImpl(
      {required this.name, required final List<String> parameters})
      : _parameters = parameters;

  factory _$ContractActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContractActionImplFromJson(json);

  @override
  final String name;
  final List<String> _parameters;
  @override
  List<String> get parameters {
    if (_parameters is EqualUnmodifiableListView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parameters);
  }

  @override
  String toString() {
    return 'ContractAction(name: $name, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractActionImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_parameters));

  /// Create a copy of ContractAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractActionImplCopyWith<_$ContractActionImpl> get copyWith =>
      __$$ContractActionImplCopyWithImpl<_$ContractActionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractActionImplToJson(
      this,
    );
  }
}

abstract class _ContractAction implements ContractAction {
  const factory _ContractAction(
      {required final String name,
      required final List<String> parameters}) = _$ContractActionImpl;

  factory _ContractAction.fromJson(Map<String, dynamic> json) =
      _$ContractActionImpl.fromJson;

  @override
  String get name;
  @override
  List<String> get parameters;

  /// Create a copy of ContractAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContractActionImplCopyWith<_$ContractActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Contract _$ContractFromJson(Map<String, dynamic> json) {
  return _Contract.fromJson(json);
}

/// @nodoc
mixin _$Contract {
  String? get bytecode => throw _privateConstructorUsedError;
  ContractManifest get manifest => throw _privateConstructorUsedError;

  /// Serializes this Contract to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Contract
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContractCopyWith<Contract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractCopyWith<$Res> {
  factory $ContractCopyWith(Contract value, $Res Function(Contract) then) =
      _$ContractCopyWithImpl<$Res, Contract>;
  @useResult
  $Res call({String? bytecode, ContractManifest manifest});

  $ContractManifestCopyWith<$Res> get manifest;
}

/// @nodoc
class _$ContractCopyWithImpl<$Res, $Val extends Contract>
    implements $ContractCopyWith<$Res> {
  _$ContractCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Contract
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytecode = freezed,
    Object? manifest = null,
  }) {
    return _then(_value.copyWith(
      bytecode: freezed == bytecode
          ? _value.bytecode
          : bytecode // ignore: cast_nullable_to_non_nullable
              as String?,
      manifest: null == manifest
          ? _value.manifest
          : manifest // ignore: cast_nullable_to_non_nullable
              as ContractManifest,
    ) as $Val);
  }

  /// Create a copy of Contract
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContractManifestCopyWith<$Res> get manifest {
    return $ContractManifestCopyWith<$Res>(_value.manifest, (value) {
      return _then(_value.copyWith(manifest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContractImplCopyWith<$Res>
    implements $ContractCopyWith<$Res> {
  factory _$$ContractImplCopyWith(
          _$ContractImpl value, $Res Function(_$ContractImpl) then) =
      __$$ContractImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? bytecode, ContractManifest manifest});

  @override
  $ContractManifestCopyWith<$Res> get manifest;
}

/// @nodoc
class __$$ContractImplCopyWithImpl<$Res>
    extends _$ContractCopyWithImpl<$Res, _$ContractImpl>
    implements _$$ContractImplCopyWith<$Res> {
  __$$ContractImplCopyWithImpl(
      _$ContractImpl _value, $Res Function(_$ContractImpl) _then)
      : super(_value, _then);

  /// Create a copy of Contract
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytecode = freezed,
    Object? manifest = null,
  }) {
    return _then(_$ContractImpl(
      bytecode: freezed == bytecode
          ? _value.bytecode
          : bytecode // ignore: cast_nullable_to_non_nullable
              as String?,
      manifest: null == manifest
          ? _value.manifest
          : manifest // ignore: cast_nullable_to_non_nullable
              as ContractManifest,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContractImpl extends _Contract {
  const _$ContractImpl({required this.bytecode, required this.manifest})
      : super._();

  factory _$ContractImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContractImplFromJson(json);

  @override
  final String? bytecode;
  @override
  final ContractManifest manifest;

  @override
  String toString() {
    return 'Contract(bytecode: $bytecode, manifest: $manifest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractImpl &&
            (identical(other.bytecode, bytecode) ||
                other.bytecode == bytecode) &&
            (identical(other.manifest, manifest) ||
                other.manifest == manifest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bytecode, manifest);

  /// Create a copy of Contract
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractImplCopyWith<_$ContractImpl> get copyWith =>
      __$$ContractImplCopyWithImpl<_$ContractImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractImplToJson(
      this,
    );
  }
}

abstract class _Contract extends Contract {
  const factory _Contract(
      {required final String? bytecode,
      required final ContractManifest manifest}) = _$ContractImpl;
  const _Contract._() : super._();

  factory _Contract.fromJson(Map<String, dynamic> json) =
      _$ContractImpl.fromJson;

  @override
  String? get bytecode;
  @override
  ContractManifest get manifest;

  /// Create a copy of Contract
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContractImplCopyWith<_$ContractImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
