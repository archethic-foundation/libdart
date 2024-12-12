// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_lib_dart/src/model/transaction.dart';

class TransactionsResponseData {
  TransactionsResponseData({
    this.networkTransactions,
  });

  factory TransactionsResponseData.fromJson(Map<String, dynamic> json) =>
      TransactionsResponseData(
        networkTransactions: json['networkTransactions'] == null
            ? null
            : List<Transaction>.from(
                json['networkTransactions']
                    .map((dynamic x) => Transaction.fromJson(x)),
              ),
      );

  List<Transaction>? networkTransactions;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'networkTransactions': List<Transaction>.from(
          networkTransactions!.map((Transaction x) => x.toJson()),
        ),
      };
}
