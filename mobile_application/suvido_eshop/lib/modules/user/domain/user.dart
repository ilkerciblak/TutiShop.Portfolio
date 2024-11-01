import 'package:suvido_eshop/modules/user/domain/address.dart';
import 'package:suvido_eshop/modules/user/domain/payment_method.dart';

class User {
  final String identifier;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final PaymentMethod paymentMethod;
  final Address address;
  User({
    required this.identifier,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.paymentMethod,
    required this.address,
  });

  User copyWith({
    String? identifier,
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    PaymentMethod? paymentMethod,
    Address? address,
  }) {
    return User(
      identifier: identifier ?? this.identifier,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      username: username ?? this.username,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      address: address ?? this.address,
    );
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.username == username &&
        other.paymentMethod == paymentMethod &&
        other.address == address;
  }

  @override
  int get hashCode {
    return identifier.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        username.hashCode ^
        paymentMethod.hashCode ^
        address.hashCode;
  }
}
