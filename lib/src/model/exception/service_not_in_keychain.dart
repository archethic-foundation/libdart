/// SPDX-License-Identifier: AGPL-3.0-or-later

class ServiceNotInKeychainException implements Exception {
  ServiceNotInKeychainException(this.cause);
  String cause;
}
