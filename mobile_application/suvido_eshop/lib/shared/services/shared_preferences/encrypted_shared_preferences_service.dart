import 'package:shared_preferences/shared_preferences.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';
import 'package:suvido_eshop/shared/services/encryption/encription_manager.dart';

class EncrytedSharedPreferencesService extends SharedPrefencesService {
  final EncryptionManager _encryptionManager;
  EncrytedSharedPreferencesService({
    required SharedPreferences preferences,
    required EncryptionManager encryptionManager,
  })  : _encryptionManager = encryptionManager,
        super(prefences: preferences);

  @override
  Future<void> saveString(String key, String value) {
    return super.saveString(key, _encryptionManager.encypt(value));
  }

  @override
  String? getString(String key) {
    return _encryptionManager.decrypt(
      super.getString(key),
    );
  }
}
