import 'package:currency_converter/features/converter/presentation/blocs/current_currencies/current_currencies_bloc.dart';

import '../../features/converter/data/datasources/remote_datasource.dart';
import '../../features/converter/data/repositories/currency_repository_impl.dart';
import '../../features/converter/domain/repositories/currency_repository.dart';
import '../../features/converter/domain/usecases/convert_currency_usecase.dart';
import '../../features/converter/domain/usecases/get_available_currencies_usecase.dart';
import '../../features/converter/presentation/blocs/conversion/conversion_bloc.dart';
import '../../features/converter/presentation/blocs/currencies/currencies_bloc.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // 1. External
  sl.registerLazySingleton<Dio>(() => Dio());

  // 2. Data sources
  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDataSourceImpl(sl()));

  // 3. Repository
  sl.registerLazySingleton<CurrencyRepository>(
    () => CurrencyRepositoryImpl(sl()),
  );

  // 4. UseCases
  sl.registerLazySingleton<GetAvailableCurrenciesUsecase>(
    () => GetAvailableCurrenciesUsecase(sl()),
  );

  sl.registerLazySingleton<ConvertCurrencyUsecase>(
    () => ConvertCurrencyUsecase(sl()),
  );

  // 5. Bloc
  sl.registerLazySingleton<CurrenciesBloc>(() => CurrenciesBloc(sl()));

  sl.registerLazySingleton(() => ConversionBloc(sl()));

  sl.registerLazySingleton(() => CurrentCurrenciesBloc());
}
