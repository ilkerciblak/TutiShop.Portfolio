import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

abstract class ICategoryRepository {
  TaskEither<Exception, List<Category>> getCategories({
    Map<String, String>? parameters = const {},
  });
}
