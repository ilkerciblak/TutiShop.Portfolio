import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suvido_eshop/modules/authentication/data/service/dummy_json_auth_service.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';
import 'package:suvido_eshop/shared/config/security_constants.dart';
import 'package:suvido_eshop/shared/services/encryption/encription_manager.dart';
import 'package:suvido_eshop/shared/services/encryption/encryipter_mode.dart';
import 'package:suvido_eshop/shared/services/shared_preferences/encrypted_shared_preferences_service.dart';

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

  getIt.registerSingleton<EncryptionManager>(EncryptionManager(
    secureKey: SecurityConstants.encryptionKey,
    encrypterMode: EncrypterMode.fernet,
  ));

  getIt.registerSingletonAsync<SharedPrefencesService>(() async {
    final prefs = await SharedPreferences.getInstance();
    return EncrytedSharedPreferencesService(
      preferences: prefs,
      encryptionManager: getIt<EncryptionManager>(),
    );
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
