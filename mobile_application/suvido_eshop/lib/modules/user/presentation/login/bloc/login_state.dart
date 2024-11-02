import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class LoginState {
  final String username;
  final String password;
  final FetchStatus status;
  final String errorMessage;

  LoginState({
    required this.username,
    required this.password,
    required this.status,
    required this.errorMessage,
  });

  LoginState copyWith({
    String? username,
    String? password,
    FetchStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory LoginState.initial() => LoginState(
        username: "",
        password: "",
        status: FetchStatus.idle,
        errorMessage: '',
      );

  @override
  bool operator ==(covariant LoginState other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.status == status &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        status.hashCode ^
        errorMessage.hashCode;
  }
}
