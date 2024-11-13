import 'package:get_it/get_it.dart';
import 'package:suvido_eshop/shared/services/_shared_services_exporter.dart';

class TokenManager {
  final SharedPrefencesService _sharedPrefencesService;

  TokenManager({required SharedPrefencesService sharedPrefencesService})
      : _sharedPrefencesService = sharedPrefencesService;

  void saveAccessToken({required String accessToken}) async {
    _sharedPrefencesService.saveString('accessToken', accessToken);
  }

  void saveRefreshToken({required String refreshToken}) async {
    _sharedPrefencesService.saveString('refreshToken', refreshToken);
  }

  String? getAccessToken() => _sharedPrefencesService.getString('accessToken');
  String? getRefreshToken() =>
      _sharedPrefencesService.getString('refresh_token');

  Future<void> clearTokens() async {
    _sharedPrefencesService.removePair('accessToken');
    _sharedPrefencesService.removePair('refresh_token');
  }

  static TokenManager get i => GetIt.instance<TokenManager>();
}
