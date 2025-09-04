import 'package:currency_converter/core/error/failure.dart';
import 'package:currency_converter/features/converter/domain/entities/conversion_result_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/currency_entity.dart';

abstract interface class CurrencyRepository {
  Future<Either<Failure, List<CurrencyEntity>>> getAvailableCurrencies();

  Future<Either<Failure, ConversionResultEntity>> convertCurrency({
    required String from,
    required String to,
    required double amount,
  });
}
