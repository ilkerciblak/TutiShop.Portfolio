import 'dart:convert';
import 'package:suvido_eshop/modules/user/domain/address.dart';

class AddressModel {
  final String country;
  final String city;
  final String state;
  final String postalCode;
  final String address;

  AddressModel({
    required this.country,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.address,
  });

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.country == country &&
        other.city == city &&
        other.state == state &&
        other.postalCode == postalCode &&
        other.address == address;
  }

  @override
  int get hashCode {
    return country.hashCode ^
        city.hashCode ^
        state.hashCode ^
        postalCode.hashCode ^
        address.hashCode;
  }

  AddressModel copyWith({
    String? country,
    String? city,
    String? state,
    String? postalCode,
    String? address,
  }) {
    return AddressModel(
      country: country ?? this.country,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'address': address,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      country: map['country'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      postalCode: map['postalCode'] as String,
      address: map['address'] as String,
    );
  }

  factory AddressModel.fromEntity(Address address) {
    return AddressModel(
      country: address.country,
      city: address.city,
      state: address.state,
      postalCode: address.postalCode,
      address: address.address,
    );
  }

  factory AddressModel.initial() => AddressModel(
      country: "country",
      city: "city",
      state: "state",
      postalCode: "postalCode",
      address: "address");

  Address toEntity() => Address(
        country: country,
        city: city,
        state: state,
        postalCode: postalCode,
        address: address,
      );

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
