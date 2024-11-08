import 'package:suvido_eshop/shared/_project_shared_exporter.dart';
import 'package:suvido_eshop/shared/authentication/interfaces/i_auth_service.dart';
import 'package:suvido_eshop/shared/authentication/model/authentication_response.dart';
import 'package:fpdart/fpdart.dart';

class DummyJsonAuthService implements IAuthService {
  final DummyJsonApi api;

  DummyJsonAuthService({required this.api});
  @override
  TaskEither<Exception, AuthenticationResponse> login({
    String username = '',
    String password = '',
  }) {
    return TaskEither.tryCatch(
      () async {
        var response = await api.authUser(
            requestBody: {'username': username, 'password': password});

        return response.fold(
          (l) {
            throw l;
          },
          (r) {
            return AuthenticationResponse(
              userId: r['id'] as int,
              accessToken: r['accessToken'] as String,
              refreshToken: r['refreshToken'] as String,
              expireInMin: r['expiresInMin'] ?? 3,
            );
          },
        );
      },
      (error, stackTrace) {
        if (error is NetworkException) {
          return error;
        }
        return Exception("Something went wrong : $error - $stackTrace");
      },
    );
  }

  @override
  Future<void> logout() async {
    print('loggout');
  }

  @override
  TaskEither<Exception, AuthenticationResponse> refreshAuth({
    required String refreshToken,
  }) {
    return TaskEither.tryCatch(
      () async {
        var response = await api.refreshAuth(requestBody: {
          'refreshToken': refreshToken,
        });

        return response.fold(
          (l) {
            throw l;
          },
          (r) {
            return AuthenticationResponse(
              userId: r['id'] ?? 0,
              accessToken: r['accessToken'] as String,
              refreshToken: r['refreshToken'] as String,
              expireInMin: r['expiresInMin'] ?? 3,
            );
          },
        );
      },
      (error, stackTrace) {
        if (error is NetworkException) {
          return error;
        }
        return Exception("Something went wrong : $error - $stackTrace");
      },
    );
  }
}
