import 'dart:convert';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archive/archive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract.freezed.dart';
part 'contract.g.dart';

@freezed
class ContractManifest with _$ContractManifest {
  const factory ContractManifest({
    required WasmABI abi,
  }) = _ContractManifest;

  factory ContractManifest.fromJson(Map<String, dynamic> json) =>
      _$ContractManifestFromJson(json);
}

@freezed
class WasmABI with _$WasmABI {
  const factory WasmABI({
    required Map<String, String> state,
    required Map<String, WASMFunctionABI> functions,
  }) = _WasmABI;

  factory WasmABI.fromJson(Map<String, dynamic> json) =>
      _$WasmABIFromJson(json);
}

@freezed
class WASMFunctionABI with _$WASMFunctionABI {
  const factory WASMFunctionABI({
    required String type,
    String? triggerType,
    required Map<String, dynamic> input,
  }) = _WASMFunctionABI;

  factory WASMFunctionABI.fromJson(Map<String, dynamic> json) =>
      _$WASMFunctionABIFromJson(json);
}

@freezed
class ContractAction with _$ContractAction {
  const factory ContractAction({
    required String name,
    required List<String> parameters,
  }) = _ContractAction;

  factory ContractAction.fromJson(Map<String, dynamic> json) =>
      _$ContractActionFromJson(json);
}

@freezed
class Contract with _$Contract {
  const factory Contract({
    required String? bytecode,
    required ContractManifest manifest,
    @Default(true) bool compressed,
  }) = _Contract;

  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);

  factory Contract.withUncompressedBytecode({
    required String? bytecode,
    required ContractManifest manifest,
  }) {
    if (bytecode == null) {
      throw ArgumentError('Bytecode cannot be null');
    }

    final compressedBytecode =
        const ZLibEncoderWeb().encodeBytes(utf8.encode(bytecode), raw: true);

    return Contract(
      bytecode: utf8.decode(compressedBytecode),
      manifest: manifest,
    );
  }

  const Contract._();

  String? getCompressedBytecode() {
    return compressed
        ? bytecode
        : utf8.decode(
            const ZLibEncoderWeb()
                .encodeBytes(utf8.encode(bytecode!), raw: true),
          );
  }

  List<ContractAction> getActions() {
    final actions = <ContractAction>[];
    manifest.abi.functions.forEach((name, functionABI) {
      if (functionABI.type == 'action' &&
          functionABI.triggerType == 'transaction') {
        actions.add(
          ContractAction(
            name: name,
            parameters: functionABI.input.keys.toList(),
          ),
        );
      }
    });
    return actions;
  }
}

extension ContractUtils on Contract {
  void updateContractTransaction(String contractAddress) {
    const Transaction(type: 'transfer')
        .addRecipient(contractAddress, action: 'upgrade', args: [this]);
  }

  List<ContractAction> extractActionsFromContract(String code) {
    final actions = <ContractAction>[];

    final regex = RegExp(
      r'actions\s+triggered_by:\s+transaction,\s+on:\s+([\w\s.,()]+?)\s+do',
    );
    final regexActionName = RegExp(r'(\w+)\((.*?)\)');

    for (final match in regex.allMatches(code)) {
      final fullAction = match.group(1) ?? '';

      for (final actionMatch in regexActionName.allMatches(fullAction)) {
        final name = actionMatch.group(1) ?? '';
        final parameters = (actionMatch.group(2) ?? '').isNotEmpty
            ? actionMatch
                .group(2)!
                .split(',')
                .map((param) => param.trim())
                .toList()
            : <String>[];
        actions.add(
          ContractAction(
            name: name,
            parameters: parameters,
          ),
        );
      }
    }
    return actions;
  }

  dynamic parseTypedArgument(dynamic input) {
    if (input is Map) {
      return input;
    } else if (input is num || num.tryParse(input.toString()) != null) {
      return double.tryParse(input.toString()) ?? input;
    } else {
      return input;
    }
  }
}
