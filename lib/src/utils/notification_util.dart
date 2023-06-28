import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:http/http.dart' as http;

mixin NotificationUtil {
  Future<Uint8List> signTransactionNotification({
    required TransactionNotification notification,
    required KeyPair senderKeyPair,
  }) async {
    final payload = concatUint8List(<Uint8List>[
      Uint8List.fromList(hexToUint8List(notification.txAddress)),
      Uint8List.fromList(hexToUint8List(notification.txChainGenesisAddress)),
    ]);

    return crypto.sign(payload, senderKeyPair.privateKey);
  }

  Future<void> sendTransactionNotification({
    required TransactionNotification notification,
    required KeyPair senderKeyPair,
    required int txIndex,
    required String notifBackendBaseUrl,
    required Map<String, PushNotification> pushNotification,
  }) async {
    final signature = uint8ListToHex(
      await signTransactionNotification(
        notification: notification,
        senderKeyPair: senderKeyPair,
      ),
    );

    final body = jsonEncode({
      'txAddress': notification.txAddress,
      'txChainGenesisAddress': notification.txChainGenesisAddress,
      'payloadSignature': signature,
      'pushNotification': pushNotification,
    });
    log('Sending notification. $body');
    await http.post(
      Uri.parse('$notifBackendBaseUrl/transactionSent'),
      body: body,
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }
}
