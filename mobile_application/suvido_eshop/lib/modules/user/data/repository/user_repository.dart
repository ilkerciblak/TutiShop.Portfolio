import 'package:fpdart/fpdart.dart';
import 'package:suvido_eshop/modules/user/_user_module_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class UserRepository implements IUserRepository {
  final IUserService userService;

  UserRepository({required this.userService});

  @override
  TaskEither<Exception, User> getCurrentUser({
    required String accessToken,
  }) {
    return TaskEither.tryCatch(
      () async {
        var response =
            await userService.getCurrentUser(accessToken: accessToken);

        return response.fold((l) {
          throw l;
        }, (r) {
          return r.toEntity();
        });
      },
      (error, stackTrace) {
        if (error is NetworkException) {
          return error;
        }
        return Exception();
      },
    );
  }
}
