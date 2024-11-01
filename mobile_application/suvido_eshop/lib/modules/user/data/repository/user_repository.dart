import 'package:fpdart/fpdart.dart';
import 'package:suvido_eshop/modules/user/data/service/auth_service.dart';
import 'package:suvido_eshop/modules/user/domain/_user_domain_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class UserRepository implements IUserRepository {
  final AuthService authService;

  UserRepository({required this.authService});

  @override
  TaskEither<Exception, User> login(
      {required String username, required String password}) {
    return TaskEither.tryCatch(
      () async {
        var response =
            await authService.login(username: username, password: password);

        return response.fold(
          (l) {
            throw l;
          },
          (r) {
            return r.toEntity();
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
