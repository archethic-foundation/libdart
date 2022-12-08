import 'dart:typed_data';
import 'package:archethic_lib_dart/src/utils/uint8List_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'secret.freezed.dart';

@freezed
class Secret with _$Secret {
  const factory Secret({
    @Uint8ListConverter() Uint8List? iv,
    @Uint8ListConverter() Uint8List? aesKey,
  }) = _Secret;
  const Secret._();
}
