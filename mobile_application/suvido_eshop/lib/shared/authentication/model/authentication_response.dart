class AuthenticationResponse {
  final int userId;
  final String accessToken;
  final String refreshToken;
  final int expireInMin;

  AuthenticationResponse({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
    required this.expireInMin,
  });

  AuthenticationResponse copyWith({
    int? userId,
    String? accessToken,
    String? refreshToken,
    int? expireInMin,
  }) {
    return AuthenticationResponse(
      userId: userId ?? this.userId,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expireInMin: expireInMin ?? this.expireInMin,
    );
  }

  @override
  bool operator ==(covariant AuthenticationResponse other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.expireInMin == expireInMin;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        accessToken.hashCode ^
        refreshToken.hashCode ^
        expireInMin.hashCode;
  }
}
