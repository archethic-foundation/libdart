import 'package:archethic_lib_dart/src/model/address.dart';

class GenesisAddressResponseData {
  GenesisAddressResponseData({
    this.address,
  });

  factory GenesisAddressResponseData.fromJson(Map<String, dynamic> json) =>
      GenesisAddressResponseData(
        address: Address(
          address: json['genesisAddress'],
        ),
      );

  Address? address;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'genesisAddress': address?.address ?? '',
      };
}
