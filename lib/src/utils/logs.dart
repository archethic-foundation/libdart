/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:developer' as dev;

void log(String message) {
  dev.log('${DateTime.now().toString()} $message');
}
