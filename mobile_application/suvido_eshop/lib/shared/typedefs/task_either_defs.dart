import 'package:fpdart/fpdart.dart';

typedef DataTask<T> = TaskEither<Exception, T>;
typedef ExceptionEither<T> = Either<Exception, T>;
