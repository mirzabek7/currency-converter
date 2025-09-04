import 'package:bloc/bloc.dart';
import 'package:currency_converter/features/converter/domain/entities/currency_entity.dart';
import 'package:currency_converter/features/converter/domain/usecases/get_available_currencies_usecase.dart';
import 'package:equatable/equatable.dart';

part 'currencies_event.dart';
part 'currencies_state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  final GetAvailableCurrenciesUsecase getAvailableCurrenciesUsecase;
  CurrenciesBloc(this.getAvailableCurrenciesUsecase)
    : super(CurrenciesInitial()) {
    on<LoadCurrenciesEvent>(getCurrencies);
  }

  Future<void> getCurrencies(
    LoadCurrenciesEvent event,
    Emitter<CurrenciesState> emit,
  ) async {
    emit(CurrenciesLoading());
    final result = await getAvailableCurrenciesUsecase.call();
    result.fold(
      (failure) => emit(CurrenciesError(failure.message)),
      (data) => emit(CurrenciesLoaded(data)),
    );
  }
}
