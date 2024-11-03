import 'package:suvido_eshop/modules/catalog/_catalog_feature_exporter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ProductRepository implements IProductRepository {
  final ProductService productService;

  ProductRepository({required this.productService});

  @override
  TaskEither<Exception, List<Product>> getAllProducts(
      {Map<String, String>? parameters = const {}}) {
    return TaskEither.tryCatch(
      () async {
        var response =
            await productService.getAllProducts(parameters: parameters);

        return response.fold(
          (l) {
            throw l;
          },
          (data) =>
              data.map((productModel) => productModel.toEntity()).toList(),
        );
      },
      (error, stackTrace) {
        if (error is NetworkException) {
          return error;
        }

        return Exception('Something went wrong $error - $stackTrace');
      },
    );
  }

  @override
  TaskEither<Exception, List<Product>> getProductsByCategory(
      {required String categoryName,
      Map<String, String>? parameters = const {}}) {
    return TaskEither.tryCatch(
      () async {
        var response = await productService.getAllProductsByCategory(
            categoryName: categoryName, parameters: parameters);

        return response.fold(
          (l) {
            throw l;
          },
          (data) =>
              data.map((productModel) => productModel.toEntity()).toList(),
        );
      },
      (error, stackTrace) {
        if (error is NetworkException) {
          return error;
        }

        return Exception('Something went wrong $error - $stackTrace');
      },
    );
  }

  @override
  TaskEither<Exception, Product> getSingleProduct(
      {required String productId, Map<String, String>? parameters = const {}}) {
    return TaskEither.tryCatch(
      () async {
        var response = await productService.getSingleProduct(
            productId: productId, parameters: parameters);

        return response.fold(
          (l) {
            throw l;
          },
          (data) => data.toEntity(),
        );
      },
      (error, stackTrace) {
        if (error is NetworkException) {
          return error;
        }

        return Exception('Something went wrong $error - $stackTrace');
      },
    );
  }
}
