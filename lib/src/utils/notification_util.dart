import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:http/http.dart' as http;

mixin NotificationUtil {
  Future<Uint8List> signTransactionNotification({
    required String notificationRecipientAddress,
    required String listenAddress,
    required KeyPair senderKeyPair,
  }) async {
    final payload = concatUint8List(
      <Uint8List>[
        Uint8List.fromList(
          hexToUint8List(notificationRecipientAddress),
        ),
        Uint8List.fromList(
          hexToUint8List(listenAddress),
        ),
      ],
    );

    return crypto.sign(payload, senderKeyPair.privateKey);
  }

  Future<void> sendTransactionNotification({
    required TransactionNotification notification,
    required KeyPair senderKeyPair,
    required String notifBackendBaseUrl,
    required Map<String, PushNotification> pushNotification,
    required String transactionType,
  }) async {
    for (final listenAddress in notification.listenAddresses) {
      final signature = uint8ListToHex(
        await signTransactionNotification(
          notificationRecipientAddress:
              notification.notificationRecipientAddress,
          listenAddress: listenAddress,
          senderKeyPair: senderKeyPair,
        ),
      );

      final body = jsonEncode({
        'txAddress': notification.notificationRecipientAddress,
        'txChainGenesisAddress': listenAddress,
        'payloadSignature': signature,
        'pushNotification': pushNotification,
        'type': transactionType
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
}
