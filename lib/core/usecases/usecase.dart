import 'package:currency_converter/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Usecase<Type, Param> {
  Future<Either<Failure, Type>> call(Param params);
}
