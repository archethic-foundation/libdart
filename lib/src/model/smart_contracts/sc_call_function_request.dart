import 'package:archethic_lib_dart/src/model/smart_contracts/sc_call_function_params.dart';
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
