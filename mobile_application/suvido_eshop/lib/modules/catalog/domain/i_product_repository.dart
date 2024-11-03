import 'package:fpdart/fpdart.dart';
import 'package:suvido_eshop/modules/catalog/domain/_catalog_domain_exporter.dart';

abstract class IProductRepository {
  TaskEither<Exception, List<Product>> getAllProducts({
    Map<String, String>? parameters = const {},
  });

  TaskEither<Exception, List<Product>> getProductsByCategory({
    required String categoryName,
    Map<String, String>? parameters = const {},
  });

  TaskEither<Exception, Product> getSingleProduct({
    required String productId,
    Map<String, String>? parameters = const {},
  });
}
