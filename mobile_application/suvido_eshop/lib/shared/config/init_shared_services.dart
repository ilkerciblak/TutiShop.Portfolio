import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suvido_eshop/modules/authentication/data/service/dummy_json_auth_service.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

final getIt = GetIt.instance;

Future<void> initSharedServices() async {
  getIt.registerSingleton<DummyJsonApi>(
    DummyJsonApi(
      networkManager: NetworkManager(
        baseUrl: EnvironmentVariables.dummyJsonBaseUrl,
        timeOut: 5,
      ),
    ),
  );

  getIt.registerSingletonAsync<SharedPrefencesService>(() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPrefencesService(prefences: prefs);
  });

  await getIt.isReady<SharedPrefencesService>();

  getIt.registerSingleton<TokenManager>(
    TokenManager(
      sharedPrefencesService: getIt<SharedPrefencesService>(),
    ),
  );

  getIt.registerSingleton<IAuthService>(
      DummyJsonAuthService(
        api: getIt<DummyJsonApi>(),
      ),
      instanceName: 'dummyAuthService');

  getIt.registerSingleton<AuthManager>(
    AuthManager(
      authService: getIt<IAuthService>(instanceName: 'dummyAuthService'),
      tokenManager: getIt<TokenManager>(),
    ),
    instanceName: 'dummyAuthManager',
  );

  getIt.registerSingleton<Authentication>(
    Authentication.none(),
  );
}
