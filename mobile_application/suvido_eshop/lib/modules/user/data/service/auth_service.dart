import 'package:suvido_eshop/modules/user/data/model/user_model.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class AuthService {
  final DummyJsonApi api;

  AuthService({required this.api});

  Future<ExceptionEither<UserModel>> login({
    required String username,
    required String password,
  }) async {
    var response = await api.authUser(
      requestBody: {
        'username': username,
        'password': password,
      },
    );

    return response.map(
      (data) => UserModel.fromMap(data),
    );
  }
}
