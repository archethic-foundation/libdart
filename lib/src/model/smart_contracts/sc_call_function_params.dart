/// SPDX-License-Identifier: AGPL-3.0-or-later
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sc_call_function_params.freezed.dart';
part 'sc_call_function_params.g.dart';

@freezed
class SCCallFunctionParams with _$SCCallFunctionParams {
  factory SCCallFunctionParams({
    required String contract,
    required String function,
    required List<dynamic> args,
    @Default(true) @JsonKey(name: 'resolve_last') bool resolveLast,
  }) = _SCCallFunctionParams;

  factory SCCallFunctionParams.fromJson(Map<String, dynamic> json) =>
      _$SCCallFunctionParamsFromJson(json);
}
