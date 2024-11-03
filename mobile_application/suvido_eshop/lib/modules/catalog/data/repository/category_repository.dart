import 'package:fpdart/fpdart.dart';
import 'package:suvido_eshop/modules/catalog/data/service/_catalog_service_exporter.dart';
import 'package:suvido_eshop/modules/catalog/domain/_catalog_domain_exporter.dart';

import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class CategoryRepository implements ICategoryRepository {
  final CategoryService categoryService;

  CategoryRepository({required this.categoryService});

  @override
  TaskEither<Exception, List<Category>> getCategories(
      {Map<String, String>? parameters = const {}}) {
    return TaskEither.tryCatch(
      () async {
        var response =
            await categoryService.getAllCategories(parameters: parameters);

        return response.fold(
          (l) {
            throw l;
          },
          (r) {
            return r
                .map(
                  (categoryModel) => categoryModel.toEntity(),
                )
                .toList();
          },
        );
      },
      (error, stackTrace) {
        if (error is NetworkException) {
          return error;
        }

        return Exception('Something went wrong - $error : $stackTrace');
      },
    );
  }
}
