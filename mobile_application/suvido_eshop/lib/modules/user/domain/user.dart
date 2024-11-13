// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get_it/get_it.dart';
import 'package:suvido_eshop/modules/user/domain/address.dart';
import 'package:suvido_eshop/modules/user/domain/payment_method.dart';

class User {
  final int identifier;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final PaymentMethod paymentMethod;
  final Address address;
  final String image;
  User({
    required this.identifier,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.paymentMethod,
    required this.address,
    required this.image,
  });

  User copyWith({
    int? identifier,
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    PaymentMethod? paymentMethod,
    Address? address,
    String? image,
  }) {
    return User(
      identifier: identifier ?? this.identifier,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      username: username ?? this.username,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      address: address ?? this.address,
      image: image ?? this.image,
    );
  }

  factory User.def() => User(
        identifier: 0,
        firstName: '',
        lastName: '',
        email: '',
        username: '',
        paymentMethod:
            PaymentMethod(cardNumber: '', cardType: '', cardExpire: ''),
        address: Address(
            country: '', city: '', state: '', postalCode: '', address: ''),
        image: '',
      );

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.username == username &&
        other.paymentMethod == paymentMethod &&
        other.address == address &&
        other.image == image;
  }

  @override
  int get hashCode {
    return identifier.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        username.hashCode ^
        paymentMethod.hashCode ^
        address.hashCode ^
        image.hashCode;
  }

  User get i => GetIt.instance<User>();
}
