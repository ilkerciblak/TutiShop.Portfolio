import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class AuthManager {
  final IAuthService authService;
  final TokenManager tokenManager;

  AuthManager({
    required this.authService,
    required this.tokenManager,
  });

  TaskEither<Exception, void> login(
      {String username = '', String password = ''}) {
    return TaskEither.tryCatch(
      () async {
        var response = await authService
            .login(username: username, password: password)
            .run();

        response.fold((l) {
          throw l;
        }, (r) {
          tokenManager.saveAccessToken(accessToken: r.accessToken);
          tokenManager.saveRefreshToken(refreshToken: r.refreshToken);
          GetIt.instance<Authentication>().setAuthenticated(
            userId: r.userId,
            expireInMin: r.expireInMin,
          );
        });
      },
      (error, stackTrace) {
        if (error is NetworkException) {
          return error;
        }

        return Exception('Something wrong happened $error : $stackTrace');
      },
    );
  }

  Future<void> logout() async {
    await authService.logout();
    await tokenManager.clearTokens();
    GetIt.instance<Authentication>().setNone();
  }

  TaskEither<Exception, void> refreshToken() {
    return TaskEither.tryCatch(
      () async {
        var response = await authService
            .refreshAuth(
              refreshToken: tokenManager.getRefreshToken() ?? '',
            )
            .run();

        response.fold(
          (l) {
            throw l;
          },
          (r) {
            tokenManager.saveAccessToken(accessToken: r.accessToken);
            tokenManager.saveRefreshToken(refreshToken: r.refreshToken);
            GetIt.instance<Authentication>().setAuthenticated(
              userId: r.userId,
              expireInMin: r.expireInMin,
            );
          },
        );
      },
      (error, stackTrace) {
        return Exception();
      },
    );
  }
}
