import 'dart:typed_data';
import 'package:archethic_lib_dart/src/utils/uint8List_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Holds a key pair (private and public key)

part 'aes_auth_encrypt_infos.freezed.dart';

@freezed
class AesAuthEncryptInfos with _$AesAuthEncryptInfos {
  const factory AesAuthEncryptInfos({
    @Uint8ListConverter() Uint8List? tag,
    @Uint8ListConverter() Uint8List? encrypted,
  }) = _AesAuthEncryptInfos;
  const AesAuthEncryptInfos._();
}
