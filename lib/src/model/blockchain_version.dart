import 'package:freezed_annotation/freezed_annotation.dart';

part 'blockchain_version.freezed.dart';
part 'blockchain_version.g.dart';

/// [BlockchainVersionModel] represents code, transaction and protocol Blockchain's version
@freezed
class BlockchainVersionModel with _$BlockchainVersionModel {
  const factory BlockchainVersionModel({
    required BlockchainVersion version,
  }) = _BlockchainVersionModel;

  factory BlockchainVersionModel.fromJson(Map<String, dynamic> json) =>
      _$BlockchainVersionModelFromJson(json);
}

@freezed
class BlockchainVersion with _$BlockchainVersion {
  const factory BlockchainVersion({
    String? code,
    required String protocol,
    required String transaction,
  }) = _BlockchainVersion;

  factory BlockchainVersion.fromJson(Map<String, dynamic> json) =>
      _$BlockchainVersionFromJson(json);
}
