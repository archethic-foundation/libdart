import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_notification.freezed.dart';

@freezed
class TransactionNotification with _$TransactionNotification {
  const factory TransactionNotification({
    required String txAddress,
    required String txChainGenesisAddress,
  }) = _TransactionNotification;
  const TransactionNotification._();
}
