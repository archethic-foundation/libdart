import 'dart:convert';

import 'package:archethic_lib_dart/src/model/exception/archethic_json_rpc_exception.dart';

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

  dynamic getJsonRPCResult(String body) {
    final jsonResponse = json.decode(body);
    if (jsonResponse.containsKey('error')) {
      throw ArchethicJsonRPCException(
        code: jsonResponse['error']['code'] ?? jsonResponse['error']['code'],
        message: jsonResponse['error']['message'] ??
            jsonResponse['error']['message'],
        data: jsonResponse['error']['data'] ?? jsonResponse['error']['data'],
      );
    }
    return jsonResponse['result'];
  }

  String getJsonRPCResultString(String body) {
    final jsonResponse = json.decode(body);
    if (jsonResponse.containsKey('error')) {
      throw ArchethicJsonRPCException(
        code: jsonResponse['error']['code'] ?? jsonResponse['error']['code'],
        message: jsonResponse['error']['message'] ??
            jsonResponse['error']['message'],
        data: jsonResponse['error']['data'] ?? jsonResponse['error']['data'],
      );
    }

    return jsonResponse['result'].toString();
  }
}
