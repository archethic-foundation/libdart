import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_status.freezed.dart';
part 'transaction_status.g.dart';

TransactionStatus transactionStatusFromJson(String str) =>
    TransactionStatus.fromJson(json.decode(str));

@freezed
class TransactionStatus with _$TransactionStatus {
  const factory TransactionStatus({
    String? status,
  }) = _TransactionStatus;
  const TransactionStatus._();

  factory TransactionStatus.fromJson(Map<String, dynamic> json) =>
      _$TransactionStatusFromJson(json);
}
