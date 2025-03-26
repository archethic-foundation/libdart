import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_input.freezed.dart';
part 'transaction_input.g.dart';

/// [TransactionInput] represents the inputs from the transaction.
@freezed
class TransactionInput with _$TransactionInput {
  const factory TransactionInput({
    /// Asset amount
    int? amount,

    /// Transaction which send the amount of assets
    String? from,

    /// Address of the token if the type is token
    String? tokenAddress,

    /// Determines if the input has been spent
    bool? spent,

    /// Date time when the inputs was generated
    int? timestamp,

    /// Type of the input: UCO/Token/Call
    String? type,

    /// Id for a token which is allocated when the token is minted.
    int? tokenId,
  }) = _TransactionInput;
  const TransactionInput._();

  factory TransactionInput.fromJson(Map<String, dynamic> json) =>
      _$TransactionInputFromJson(json);
}
