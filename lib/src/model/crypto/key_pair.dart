import 'dart:typed_data';

import 'package:archethic_lib_dart/src/utils/uint8List_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'key_pair.freezed.dart';

/// Holds a key pair (private and public key)
@freezed
class KeyPair with _$KeyPair {
  const factory KeyPair({
    @Uint8ListConverter() Uint8List? privateKey,
    @Uint8ListConverter() Uint8List? publicKey,
  }) = _KeyPair;
  const KeyPair._();
}
