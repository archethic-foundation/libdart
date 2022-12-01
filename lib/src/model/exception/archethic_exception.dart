// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:archethic_lib_dart/archethic_lib_dart.dart';

/// SPDX-License-Identifier: AGPL-3.0-or-later

abstract class ArchethicException implements Exception {}

@immutable
class ArchethicConnectionException implements ArchethicException {
  final String cause;
  const ArchethicConnectionException(this.cause);
}

@immutable
class ArchethicInvalidResponseException implements ArchethicException {
  final String cause;
  const ArchethicInvalidResponseException(this.cause);
}

@immutable
class ArchethicRequestException implements ArchethicException {
  final List<Error> errors;
  const ArchethicRequestException(this.errors);
}
