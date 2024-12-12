// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class ArchethicJsonRPCException implements Exception {
  const ArchethicJsonRPCException({
    required this.code,
    required this.message,
    this.data,
  });
  final int code;
  final String message;
  final Object? data;
}
