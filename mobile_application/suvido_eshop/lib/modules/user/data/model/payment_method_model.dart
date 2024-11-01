// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:suvido_eshop/modules/user/entity/payment_method.dart';

class PaymentMethodModel {
  final String cardNumber;
  final String cardType;
  final String cardExpire;
  PaymentMethodModel({
    required this.cardNumber,
    required this.cardType,
    required this.cardExpire,
  });

  PaymentMethodModel copyWith({
    String? cardNumber,
    String? cardType,
    String? cardExpire,
  }) {
    return PaymentMethodModel(
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      cardExpire: cardExpire ?? this.cardExpire,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardNumber': cardNumber,
      'cardType': cardType,
      'cardExpire': cardExpire,
    };
  }

  factory PaymentMethodModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodModel(
      cardNumber: map['cardNumber'] as String,
      cardType: map['cardType'] as String,
      cardExpire: map['cardExpire'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethodModel.fromJson(String source) =>
      PaymentMethodModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory PaymentMethodModel.fromEntity(PaymentMethod paymentMethod) {
    return PaymentMethodModel(
      cardNumber: paymentMethod.cardNumber,
      cardType: paymentMethod.cardType,
      cardExpire: paymentMethod.cardExpire,
    );
  }

  PaymentMethod toEntity() => PaymentMethod(
        cardNumber: cardNumber,
        cardType: cardType,
        cardExpire: cardExpire,
      );

  @override
  bool operator ==(covariant PaymentMethodModel other) {
    if (identical(this, other)) return true;

    return other.cardNumber == cardNumber &&
        other.cardType == cardType &&
        other.cardExpire == cardExpire;
  }

  @override
  int get hashCode =>
      cardNumber.hashCode ^ cardType.hashCode ^ cardExpire.hashCode;
}
