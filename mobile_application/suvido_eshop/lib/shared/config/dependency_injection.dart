import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suvido_eshop/modules/user/data/repository/user_repository.dart';
import 'package:suvido_eshop/modules/user/data/service/auth_service.dart';
import 'package:suvido_eshop/modules/user/domain/i_user_repository.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';
import 'package:suvido_eshop/shared/networking/network_manager.dart';

final getIt = GetIt.instance;

Future<void> initProject() async {
  getIt.registerSingleton<DummyJsonApi>(
    DummyJsonApi(
      networkManager: NetworkManager(
        baseUrl: EnvironmentVariables.dummyJsonBaseUrl,
        timeOut: 5,
      ),
    ),
  );

  getIt.registerSingleton<AuthService>(
    AuthService(
      api: getIt<DummyJsonApi>(),
    ),
  );

  getIt.registerSingleton<IUserRepository>(
    UserRepository(
      authService: getIt<AuthService>(),
    ),
  );

  getIt.registerSingletonAsync<SharedPrefencesService>(() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPrefencesService(prefences: prefs);
  });

  await getIt.allReady();
}
