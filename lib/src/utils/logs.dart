/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:developer' as dev;

void log(String message, {bool logsActivation = true, String name = ''}) {
  if (logsActivation) {
    if (name.isEmpty) {
      dev.log('${DateTime.now()} $message');
    } else {
      dev.log('${DateTime.now()} $message', name: name);
    }
  }
}
