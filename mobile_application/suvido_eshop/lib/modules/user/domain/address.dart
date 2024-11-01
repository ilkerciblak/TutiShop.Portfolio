class Address {
  final String country;
  final String city;
  final String state;
  final String postalCode;
  final String address;
  Address({
    required this.country,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.address,
  });

  Address copyWith({
    String? country,
    String? city,
    String? state,
    String? postalCode,
    String? address,
  }) {
    return Address(
      country: country ?? this.country,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      address: address ?? this.address,
    );
  }

  @override
  bool operator ==(covariant Address other) {
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
}
