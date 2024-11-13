import 'package:fpdart/fpdart.dart';
import 'package:suvido_eshop/modules/user/_user_module_exporter.dart';

abstract class IUserRepository {
  TaskEither<Exception, User> getCurrentUser({
    required String accessToken,
  });

  TaskEither<Exception, User> updateUser({
    required String accessToken,
    required User user,
  });
}
