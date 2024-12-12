// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_lib_dart/src/model/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_fee.freezed.dart';
part 'transaction_fee.g.dart';

@freezed
class TransactionFee with _$TransactionFee {
  const factory TransactionFee({
    int? fee,
    Rates? rates,
    TransactionFeeErrors? errors,
  }) = _TransactionFee;
  const TransactionFee._();

  factory TransactionFee.fromJson(Map<String, dynamic> json) =>
      _$TransactionFeeFromJson(json);
}

@freezed
class Rates with _$Rates {
  const factory Rates({
    double? eur,
    double? usd,
    TransactionFeeErrors? errors,
  }) = _Rates;
  const Rates._();

  factory Rates.fromJson(Map<String, dynamic> json) => _$RatesFromJson(json);
}

@freezed
class TransactionFeeErrors with _$TransactionFeeErrors {
  const factory TransactionFeeErrors({
    Data? data,
    TransactionFeeErrors? errors,
  }) = _TransactionFeeErrors;
  const TransactionFeeErrors._();

  factory TransactionFeeErrors.fromJson(Map<String, dynamic> json) =>
      _$TransactionFeeErrorsFromJson(json);
}
