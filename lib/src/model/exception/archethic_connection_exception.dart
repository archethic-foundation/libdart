/// SPDX-License-Identifier: AGPL-3.0-or-later

class ArchethicConnectionException implements Exception {
  ArchethicConnectionException(this.cause);
  String cause;
}
