/// SPDX-License-Identifier: AGPL-3.0-or-later

class ArchethicConnectionException implements Exception {
  String cause;
  ArchethicConnectionException(this.cause);
}
