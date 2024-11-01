class PaymentMethod {
  final String cardNumber;
  final String cardType;
  final String cardExpire;
  PaymentMethod({
    required this.cardNumber,
    required this.cardType,
    required this.cardExpire,
  });

  PaymentMethod copyWith({
    String? cardNumber,
    String? cardType,
    String? cardExpire,
  }) {
    return PaymentMethod(
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      cardExpire: cardExpire ?? this.cardExpire,
    );
  }

  @override
  bool operator ==(covariant PaymentMethod other) {
    if (identical(this, other)) return true;

    return other.cardNumber == cardNumber &&
        other.cardType == cardType &&
        other.cardExpire == cardExpire;
  }

  @override
  int get hashCode =>
      cardNumber.hashCode ^ cardType.hashCode ^ cardExpire.hashCode;
}
