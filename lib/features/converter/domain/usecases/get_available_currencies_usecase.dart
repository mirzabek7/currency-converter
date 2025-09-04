import 'package:currency_converter/core/error/failure.dart';
import 'package:currency_converter/features/converter/domain/entities/currency_entity.dart';
import 'package:currency_converter/features/converter/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';

class GetAvailableCurrenciesUsecase {
  final CurrencyRepository repository;

  GetAvailableCurrenciesUsecase(this.repository);

  Future<Either<Failure, List<CurrencyEntity>>> call() async {
    return await repository.getAvailableCurrencies();
  }
}
