import 'package:fpdart/fpdart.dart';
import 'package:suvido_eshop/modules/catalog/domain/_catalog_domain_exporter.dart';

abstract class ICategoryRepository {
  TaskEither<Exception, List<Category>> getCategories({
    Map<String, String>? parameters = const {},
  });
}
