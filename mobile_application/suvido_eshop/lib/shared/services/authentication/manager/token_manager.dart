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

  String? getAccessToken() => _sharedPrefencesService.getString('access_token');
  String? getRefreshToken() =>
      _sharedPrefencesService.getString('refresh_token');

  Future<void> clearTokens() async {
    _sharedPrefencesService.removePair('access_token');
    _sharedPrefencesService.removePair('refresh_token');
  }
}
