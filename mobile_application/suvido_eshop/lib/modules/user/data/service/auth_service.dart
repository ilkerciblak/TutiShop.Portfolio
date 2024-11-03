import 'package:suvido_eshop/modules/user/data/model/_user_model_exporter.dart';
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
      (data) => UserModel(
        identifier: data['id'] ?? 0,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        email: data['email'] ?? '',
        username: data['username'] ?? '',
        paymentMethod: data['paymentMethod'] ?? PaymentMethodModel.initial(),
        address: data['address'] ?? AddressModel.initial(),
      ),
    );
  }
}
