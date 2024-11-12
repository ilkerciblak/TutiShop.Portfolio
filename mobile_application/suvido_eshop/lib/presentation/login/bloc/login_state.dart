import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class LoginState {
  final String username;
  final String password;
  final FetchStatus status;
  final bool obscureText;
  final String errorMessage;

  LoginState({
    required this.username,
    required this.password,
    required this.status,
    required this.errorMessage,
    required this.obscureText,
  });

  LoginState copyWith({
    String? username,
    String? password,
    FetchStatus? status,
    String? errorMessage,
    bool? obscureText,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      obscureText: obscureText ?? this.obscureText,
    );
  }

  factory LoginState.initial() => LoginState(
        username: "",
        password: "",
        status: FetchStatus.idle,
        errorMessage: '',
        obscureText: true,
      );

  @override
  bool operator ==(covariant LoginState other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.status == status &&
        other.errorMessage == errorMessage &&
        other.obscureText == obscureText;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        status.hashCode ^
        obscureText.hashCode ^
        errorMessage.hashCode;
  }
}
