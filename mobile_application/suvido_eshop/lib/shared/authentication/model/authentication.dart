import 'package:flutter/foundation.dart';
import 'package:suvido_eshop/shared/enums/authentication_status.dart';

class Authentication with ChangeNotifier {
  int userId;
  int expireInMin;
  AuthenticationStatus _authenticationStatus;

  Authentication({
    required this.userId,
    required this.expireInMin,
    AuthenticationStatus authenticationStatus = AuthenticationStatus.not,
  }) : _authenticationStatus = authenticationStatus;

  factory Authentication.none() => Authentication(
        userId: 0,
        expireInMin: 0,
        authenticationStatus: AuthenticationStatus.not,
      );

  void setAuthenticated({
    required int userId,
    required int expireInMin,
  }) {
    this.userId = userId;
    this.expireInMin = expireInMin;
    _authenticationStatus = AuthenticationStatus.authenticated;
  }

  void setExpired() {
    _authenticationStatus = AuthenticationStatus.expired;
    notifyListeners();
  }

  void setNone() {
    userId = 0;
    expireInMin = 0;
    _authenticationStatus = AuthenticationStatus.not;
  }

  AuthenticationStatus get authenticationStatus => _authenticationStatus;

  @override
  bool operator ==(covariant Authentication other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.authenticationStatus == _authenticationStatus;
  }

  @override
  int get hashCode => userId.hashCode ^ _authenticationStatus.hashCode;
}
