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
      (data) => (data['products'] as List<dynamic>)
          .map(
            (product) => _dummyProductModelMapper(product),
          )
          .toList(),
    );
  }

  Future<ExceptionEither<List<ProductModel>>> getAllProductsByCategory({
    required String categoryName,
    Map<String, String>? parameters = const {},
  }) async {
    var response = await api.getProductsByCategory(
        parameters: parameters, categoryName: categoryName);

    return response.map(
      (data) => (data['products'] as List<dynamic>)
          .map(
            (product) => _dummyProductModelMapper(product),
          )
          .toList(),
    );
  }

  Future<ExceptionEither<ProductModel>> getSingleProduct({
    required String productId,
    Map<String, String>? parameters = const {},
  }) async {
    var response = await api.getSingleProduct(productId: productId);

    return response.map(
      (data) => _dummyProductModelMapper(data),
    );
  }

  ProductModel _dummyProductModelMapper(Map<String, dynamic> map) {
    return ProductModel(
      identifier: map['id'] ?? 0,
      categoryId: map['categoryId'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      categoryName: map['category'] ?? '',
      price: map['price'] ?? 0.0,
      rating: map['rating'] ?? 0.0,
      stock: map['stock'] ?? 0,
      thumbnail: map['thumbnail'] ?? '',
      reviews: (map['reviews'] ?? [])
          .map<ReviewModel>(
            (x) => ReviewModel(
              rating: x['rating'],
              comment: x['comment'],
              username: x['reviewerName'],
              date: x['date'],
            ),
          )
          .toList(),
      images: (map['images'] ?? []).map<String>((x) => x.toString()).toList(),
    );
  }
}
