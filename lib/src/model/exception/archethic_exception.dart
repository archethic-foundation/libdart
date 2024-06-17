/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class ArchethicException implements Exception {}

@immutable
class ArchethicConnectionException implements ArchethicException {
  const ArchethicConnectionException(this.cause);
  final String cause;
}

@immutable
class ArchethicInvalidResponseException implements ArchethicException {
  const ArchethicInvalidResponseException(this.cause);
  final String cause;
}

@immutable
class ArchethicRequestException implements ArchethicException {
  const ArchethicRequestException(this.errors);
  final List<Error> errors;
}

@immutable
class ArchethicTooManyRequestsException implements ArchethicException {
  const ArchethicTooManyRequestsException();
}
