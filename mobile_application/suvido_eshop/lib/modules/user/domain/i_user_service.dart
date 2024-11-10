import 'package:suvido_eshop/modules/user/_user_module_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

abstract class IUserService {
  Future<ExceptionEither<UserModel>> getCurrentUser({
    required String accessToken,
  });
}
