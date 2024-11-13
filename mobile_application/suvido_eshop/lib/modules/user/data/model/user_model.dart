// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:suvido_eshop/modules/user/data/model/address_model.dart';
import 'package:suvido_eshop/modules/user/data/model/payment_method_model.dart';
import 'package:suvido_eshop/modules/user/domain/user.dart';

class UserModel {
  final int identifier;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final PaymentMethodModel paymentMethod;
  final AddressModel address;
  final String img;
  UserModel({
    required this.identifier,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.paymentMethod,
    required this.address,
    required this.img,
  });

  UserModel copyWith({
    int? identifier,
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    PaymentMethodModel? paymentMethod,
    AddressModel? address,
    String? img,
  }) {
    return UserModel(
      identifier: identifier ?? this.identifier,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      username: username ?? this.username,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      address: address ?? this.address,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identifier': identifier,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'username': username,
      'paymentMethod': paymentMethod.toMap(),
      'address': address.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      identifier: map['identifier'] ?? map['id'],
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      paymentMethod: PaymentMethodModel.initial(),
      address: AddressModel.initial(),
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  User toEntity() => User(
      identifier: identifier,
      firstName: firstName,
      lastName: lastName,
      email: email,
      username: username,
      paymentMethod: paymentMethod.toEntity(),
      address: address.toEntity(),
      image: img);

  factory UserModel.fromEntity(User user) => UserModel(
        identifier: user.identifier,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        username: user.username,
        paymentMethod: PaymentMethodModel.fromEntity(user.paymentMethod),
        address: AddressModel.fromEntity(user.address),
        img: user.image,
      );

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.username == username &&
        other.paymentMethod == paymentMethod &&
        other.address == address &&
        other.img == img;
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
        img.hashCode;
  }
}
