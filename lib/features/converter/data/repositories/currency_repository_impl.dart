import '../../../../core/error/failure.dart';
import '../datasources/remote_datasource.dart';

import '../../domain/entities/conversion_result_entity.dart';

import '../../domain/entities/currency_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final RemoteDatasource datasource;

  const CurrencyRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, ConversionResultEntity>> convertCurrency({
    required String from,
    required String to,
    required double amount,
  }) async {
    try {
      final result = await datasource.convertCurrency(
        from: from,
        to: to,
        amount: amount,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CurrencyEntity>>> getAvailableCurrencies() async {
    try {
      final currencies = await datasource.getCurrencies();
      return Right(currencies);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
