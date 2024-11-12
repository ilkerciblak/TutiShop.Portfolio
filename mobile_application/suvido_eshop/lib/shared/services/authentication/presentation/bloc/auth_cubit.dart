import 'package:bloc/bloc.dart';
import 'package:suvido_eshop/shared/services/authentication/model/authentication.dart';
import 'package:suvido_eshop/shared/enums/authentication_status.dart';

class AuthCubit extends Cubit<Authentication> {
  // final AuthManager authManager;
  final Authentication authentication;

  AuthCubit({
    // required this.authManager,
    required this.authentication,
  }) : super(authentication);

  void onAuthStatusChanged() {
    switch (state.authenticationStatus) {
      case AuthenticationStatus.expired:
        // authManager.refreshToken().run();
        break;
      default:
    }
  }
}
