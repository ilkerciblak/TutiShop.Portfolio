import 'package:fpdart/fpdart.dart';
import 'package:suvido_eshop/modules/user/domain/user.dart';

abstract class IUserRepository {
  TaskEither<Exception, User> login(
      {required String username, required String password});
}
