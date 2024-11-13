import 'package:suvido_eshop/modules/user/_user_module_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class DummyUserService implements IUserService {
  final DummyJsonApi api;

  DummyUserService({required this.api});
  @override
  Future<ExceptionEither<UserModel>> getCurrentUser({
    required String accessToken,
  }) async {
    var response = await api.getCurrentUser(
      requestHeaders: {"Authorization": "Bearer $accessToken"},
    );

    return response.map(
      (data) => _dummyResponseUserModelMapper(data),
    );
  }

  @override
  Future<ExceptionEither<UserModel>> updateUser({
    required String accessToken,
    required Map<String, dynamic> requestBody,
    required int userId,
  }) async {
    var response = await api.updateUser(
      requestBody: requestBody,
      accessToken: accessToken,
      userId: userId,
    );

    return response.map(
      (data) => _dummyResponseUserModelMapper(data),
    );
  }

  UserModel _dummyResponseUserModelMapper(Map<String, dynamic> data) {
    return UserModel(
      identifier: data['id'] as int,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'],
      email: data['email'],
      username: data['username'] ?? '',
      paymentMethod: PaymentMethodModel(
        cardNumber: data['bank']['cardNumber'],
        cardType: data['bank']['cardType'],
        cardExpire: data['bank']['cardExpire'],
      ),
      address: AddressModel(
        country: data['address']['country'],
        city: data['address']['city'],
        state: data['address']['state'],
        postalCode: data['address']['postalCode'],
        address: data['address']['address'],
      ),
      img: data['image'] ?? '',
    );
  }
}
