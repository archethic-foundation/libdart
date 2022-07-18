/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:developer' as dev;

void log(String message) {
  dev.log('${DateTime.now().toString()} $message');
}
