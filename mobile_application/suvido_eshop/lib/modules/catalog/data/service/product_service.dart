import 'package:suvido_eshop/modules/catalog/data/_catalog_data_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ProductService {
  final DummyJsonApi api;

  ProductService({required this.api});

  Future<ExceptionEither<List<ProductModel>>> getAllProducts({
    Map<String, String>? parameters = const {},
  }) async {
    var response = await api.getProducts(parameters: parameters);

    return response.map(
      (data) => (data['products'] as List<Map<String, dynamic>>).map(
        (product) => ProductModel(
          identifier: product['id'] ?? 0,
          categoryId: product['categoryId'] ?? 0,
          title: product['title'] ?? '',
          description: product['description'] ?? '',
          categoryName: product['category'] ?? '',
          price: product['price'] ?? 0.0,
          rating: product['rating'] ?? 0.0,
          stock: product['stock'] ?? 0,
          thumbnail: product['thumbnail'] ?? '',
          images: product['images'] ?? '',
        ),
      ) as List<ProductModel>,
    );
  }

  Future<ExceptionEither<List<ProductModel>>> getAllProductsByCategory({
    required String categoryName,
    Map<String, String>? parameters = const {},
  }) async {
    var response = await api.getProductsByCategory(
        parameters: parameters, categoryName: categoryName);

    return response.map(
      (data) => (data['products'] as List<Map<String, dynamic>>).map(
        (product) => ProductModel(
          identifier: product['id'] ?? 0,
          categoryId: product['categoryId'] ?? 0,
          title: product['title'] ?? '',
          description: product['description'] ?? '',
          categoryName: product['category'] ?? '',
          price: product['price'] ?? 0.0,
          rating: product['rating'] ?? 0.0,
          stock: product['stock'] ?? 0,
          thumbnail: product['thumbnail'] ?? '',
          images: product['images'] ?? '',
        ),
      ) as List<ProductModel>,
    );
  }

  Future<ExceptionEither<ProductModel>> getSingleProduct({
    required String productId,
    Map<String, String>? parameters = const {},
  }) async {
    var response = await api.getSingleProduct(productId: productId);

    return response.map(
      (data) => ProductModel(
        identifier: data['id'] ?? 0,
        categoryId: data['categoryId'] ?? 0,
        title: data['title'] ?? '',
        description: data['description'] ?? '',
        categoryName: data['category'] ?? '',
        price: data['price'] ?? 0.0,
        rating: data['rating'] ?? 0.0,
        stock: data['stock'] ?? 0,
        thumbnail: data['thumbnail'] ?? '',
        images: data['images'] ?? '',
      ),
    );
  }
}
