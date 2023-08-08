/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sc_call_function_request.freezed.dart';
part 'sc_call_function_request.g.dart';

@freezed
class SCCallFunctionRequest with _$SCCallFunctionRequest {
  factory SCCallFunctionRequest({
    @Default('2.0') String jsonrpc,
    required String method,
    @Default(1) int id,
    required SCCallFunctionParams params,
  }) = _SCCallFunctionRequest;

  factory SCCallFunctionRequest.fromJson(Map<String, dynamic> json) =>
      _$SCCallFunctionRequestFromJson(json);
}

@freezed
class SCCallFunctionParams with _$SCCallFunctionParams {
  factory SCCallFunctionParams({
    required String contract,
    required String function,
    required List<dynamic> args,
  }) = _SCCallFunctionParams;

  factory SCCallFunctionParams.fromJson(Map<String, dynamic> json) =>
      _$SCCallFunctionParamsFromJson(json);
}
