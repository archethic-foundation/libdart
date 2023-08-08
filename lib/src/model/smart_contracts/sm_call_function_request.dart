/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sm_call_function_request.freezed.dart';
part 'sm_call_function_request.g.dart';

@freezed
class SMCallFunctionRequest with _$SMCallFunctionRequest {
  factory SMCallFunctionRequest({
    @Default('2.0') String jsonrpc,
    required String method,
    @Default(1) int id,
    required SMCallFunctionParams params,
  }) = _SMCallFunctionRequest;

  factory SMCallFunctionRequest.fromJson(Map<String, dynamic> json) =>
      _$SMCallFunctionRequestFromJson(json);
}

@freezed
class SMCallFunctionParams with _$SMCallFunctionParams {
  factory SMCallFunctionParams({
    required String contract,
    required String function,
    required List<dynamic> args,
  }) = _SMCallFunctionParams;

  factory SMCallFunctionParams.fromJson(Map<String, dynamic> json) =>
      _$SMCallFunctionParamsFromJson(json);
}
