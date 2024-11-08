import 'package:suvido_eshop/shared/_project_shared_exporter.dart';
import 'package:suvido_eshop/shared/networking/network_manager.dart';

class DummyJsonApi {
  final NetworkManager networkManager;

  DummyJsonApi({required this.networkManager});

  Future<ExceptionEither<Map<String, dynamic>>> authUser({
    required Map<String, dynamic> requestBody,
  }) async {
    return await networkManager.post(
      endPoint: EnvironmentVariables.dummyAuthLoginPath,
      body: requestBody,
    );
  }

  Future<ExceptionEither<Map<String, dynamic>>> refreshAuth({
    required Map<String, dynamic> requestBody,
  }) async {
    return await networkManager.post(
      endPoint: EnvironmentVariables.dummyAuthLoginPath,
      body: requestBody,
    );
  }

  Future<ExceptionEither<Map<String, dynamic>>> getProducts({
    Map<String, String>? parameters = const {},
  }) async {
    return networkManager.get(
      endPoint: EnvironmentVariables.dummyProductsPath,
      parameters: parameters,
    );
  }

  Future<ExceptionEither<Map<String, dynamic>>> getSingleProduct({
    required String productId,
    Map<String, String>? parameters = const {},
  }) async {
    return networkManager.get(
      endPoint: EnvironmentVariables.dummySingleProductPath.replaceFirst(
        ':id',
        productId,
      ),
      parameters: parameters,
    );
  }

  Future<ExceptionEither<Map<String, dynamic>>> getCategories({
    Map<String, String>? parameters = const {},
  }) async {
    return networkManager.get(
      endPoint: EnvironmentVariables.dummyCategoriesPath,
      parameters: parameters,
    );
  }

  Future<ExceptionEither<Map<String, dynamic>>> getProductsByCategory({
    required String categoryName,
    Map<String, String>? parameters = const {},
  }) async {
    return networkManager.get(
      endPoint: EnvironmentVariables.dummyProductByCategoryPath.replaceFirst(
        ':categoryName',
        categoryName,
      ),
      parameters: parameters,
    );
  }
}
