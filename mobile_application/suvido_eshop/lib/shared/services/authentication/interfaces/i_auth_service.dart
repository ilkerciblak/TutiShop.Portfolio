import 'package:fpdart/fpdart.dart';
import 'package:suvido_eshop/shared/services/authentication/_authentication_exporter.dart';

abstract class IAuthService {
  TaskEither<Exception, AuthenticationResponse> login(
      {String username = '', String password = ''});
  TaskEither<Exception, AuthenticationResponse> refreshAuth({
    required String refreshToken,
  });
  Future<void> logout();
}
