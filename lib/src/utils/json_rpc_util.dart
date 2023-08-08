import 'dart:convert';

import 'package:archethic_lib_dart/src/model/exception/archethic_json_rpc_exception.dart';

/// SPDX-License-Identifier: AGPL-3.0-or-later
mixin JsonRPCUtil {
  String setJsonRPCRequest(
    String method,
    Object params, {
    int id = 1,
  }) {
    return json.encode(
      {
        'jsonrpc': '2.0',
        'method': method,
        'params': params,
        'id': id,
      },
    );
  }

  Map<String, dynamic> getJsonRPCResult(String body) {
    return json.decode(
      getJsonRPCResultString(body),
    );
  }

  String getJsonRPCResultString(String body) {
    final jsonResponse = json.decode(body);
    if (jsonResponse.containsKey('error')) {
      throw ArchethicJsonRPCException(
        code: jsonResponse['error']['code'],
        message: jsonResponse['error']['message'],
        data: jsonResponse['error']['data'],
      );
    }
    return jsonResponse['result'];
  }
}
