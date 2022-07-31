/// SPDX-License-Identifier: AGPL-3.0-or-later

// Flutter imports:
import 'package:archethic_lib_dart/src/model/token.dart';

class TokenNonFungible extends Token {
  static const String kType = 'non-fungible';

  TokenNonFungible(
      {required super.address,
      required super.name,
      required super.supply,
      super.type = kType,
      required super.symbol,
      super.tokenProperties});
}
