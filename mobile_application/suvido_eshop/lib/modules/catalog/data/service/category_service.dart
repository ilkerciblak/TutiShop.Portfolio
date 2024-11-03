import 'package:suvido_eshop/modules/catalog/data/_catalog_data_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class CategoryService {
  final DummyJsonApi api;

  CategoryService({required this.api});

  Future<ExceptionEither<List<CategoryModel>>> getAllCategories(
      {Map<String, String>? parameters = const {}}) async {
    var response = await api.getCategories(parameters: parameters);

    return response.map(
      (data) => (data['list'] as List<dynamic>)
          .map(
            (category) => CategoryModel(
              identifier: category['id'] ?? 0,
              title: category['title'] ?? category['name'] ?? 'Zottiri',
              slug: category['slug'] ?? 'SlugZottiri',
            ),
          )
          .toList(),
    );
  }
}
