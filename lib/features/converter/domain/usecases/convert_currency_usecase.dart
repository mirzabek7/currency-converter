import 'package:currency_converter/core/error/failure.dart';
import 'package:currency_converter/features/converter/domain/entities/conversion_result_entity.dart';
import 'package:currency_converter/features/converter/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';

class ConvertCurrencyUsecase {
  final CurrencyRepository repository;

  ConvertCurrencyUsecase(this.repository);

  Future<Either<Failure, ConversionResultEntity>> call({
    required String from,
    required String to,
    required double amount,
  }) async {
    return await repository.convertCurrency(from: from, to: to, amount: amount);
  }
}
