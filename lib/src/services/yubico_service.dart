// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

// Package imports:
import 'package:crypto/crypto.dart' as crypto show Hmac, sha1, Digest;
import 'package:http/http.dart' as http show Response, get;
import 'package:nonce/nonce.dart';

class YubicoService {
  /// Verify OTP with YubiCloud
  /// @param {String} [otp] The OTP from the YubiKey.
  /// @param {String} [apiKey]
  /// @param {String} [id] Specifies the requestor so that the end-point can retrieve correct shared secret for signing the response.
  /// @param {int} [timeout] (optional) Number of seconds to wait for sync responses; if absent, let the server decide
  /// @param {String} [sl] (optional) A value 0 to 100 indicating percentage of syncing required by client, or strings "fast" or "secure" to use server-configured values; if absent, let the server decide
  /// @param {String} [timestamp] (optional) Timestamp=1 requests timestamp and session counter information in the response
  Future<String> verifyYubiCloudOTP(String otp, String apiKey, String id,
      {int? timeout, String? sl, String? timestamp}) async {
    String responseStatus = 'KO';
    try {
      final Uint8List apiKeyDecode64 = base64.decode(apiKey);

      /// A 16 to 40 character long string with random unique data
      final String nonce = Nonce.generate(Random().nextInt(25) + 16);

      String keyValue = 'id=' + id + '&nonce=' + nonce + '&otp=' + otp;
      if (sl != null) {
        keyValue = keyValue + '&sl=' + sl;
      }
      if (timeout != null) {
        keyValue = keyValue + '&timeout=' + timeout.toString();
      }
      if (timestamp != null) {
        keyValue = keyValue + '&timestamp=' + timestamp;
      }

      print(keyValue);

      final crypto.Hmac hmacSha1 = crypto.Hmac(crypto.sha1, apiKeyDecode64);
      final crypto.Digest sha1Result = hmacSha1.convert(keyValue.codeUnits);

      /// The optional HMAC-SHA1 signature for the request.
      final String hEncode64 = base64.encode(sha1Result.bytes);
      print(hEncode64);
      final http.Response responseHttp = await http.get(
        Uri.parse('https://api.yubico.com/wsapi/2.0/verify?' +
            keyValue +
            '&h=' +
            hEncode64),
      );

      bool nonceOk = false;
      bool otpOk = false;
      bool hOk = false;
      if (responseHttp.statusCode == 200) {
        final List<String> responseParams = responseHttp.body.split('\n');
        responseParams.removeWhere((String item) => item.trim() == '');
        responseParams
            .sort((String a, String b) => a.toString().compareTo(b.toString()));
        print(responseParams);
        for (String element in responseParams) {
          print(element);
          if (element.startsWith('status=')) {
            responseStatus = element.split('=')[1].trim();
          }
          if (element.startsWith('nonce=') &&
              element.split('=')[1].trim() == nonce) {
            nonceOk = true;
          }
          if (element.startsWith('otp=') &&
              element.split('=')[1].trim() == otp) {
            otpOk = true;
          }
          print('hEncode64: ' + hEncode64);
          print(element);

          if (element.startsWith('h=') &&
              element.split('=')[1].trim() == hEncode64) {
            hOk = true;
          }
        }
        // TODO : Verify Signature
        if (!nonceOk || !otpOk) {
          responseStatus = 'RESPONSE_KO';
        }
      }
    } catch (e) {
      responseStatus = 'RESPONSE_KO';
      print(e.toString());
    }
    print('responseStatus=' + responseStatus);
    return responseStatus;
  }
}
