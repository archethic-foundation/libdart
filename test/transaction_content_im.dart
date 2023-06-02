import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_content_im.freezed.dart';
part 'transaction_content_im.g.dart';

@freezed
abstract class TransactionContentIM with _$TransactionContentIM {
  const factory TransactionContentIM({
    required String compressionAlgo,
    required String message,
  }) = _TransactionContentIM;

  factory TransactionContentIM.fromJson(Map<String, dynamic> json) =>
      _$TransactionContentIMFromJson(json);
}
