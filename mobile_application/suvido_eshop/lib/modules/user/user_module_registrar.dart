import 'package:get_it/get_it.dart';
import 'package:suvido_eshop/modules/user/_user_module_exporter.dart';
import 'package:suvido_eshop/modules/user/data/repository/user_repository.dart';
import 'package:suvido_eshop/modules/user/data/service/dummy_user_service.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

final getIt = GetIt.instance;

Future<void> registerUserDomain() async {
  getIt.registerSingleton<IUserService>(
    DummyUserService(
      api: getIt<DummyJsonApi>(),
    ),
  );

  getIt.registerSingleton<IUserRepository>(
    UserRepository(
      userService: getIt<IUserService>(),
    ),
  );

  await getIt.allReady();
}
