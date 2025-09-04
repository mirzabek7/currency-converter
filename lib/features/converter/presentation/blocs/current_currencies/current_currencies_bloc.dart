import 'package:bloc/bloc.dart';
import 'package:currency_converter/features/converter/domain/entities/currency_entity.dart';
import 'package:equatable/equatable.dart';

part 'current_currencies_event.dart';
part 'current_currencies_state.dart';

class CurrentCurrenciesBloc
    extends Bloc<CurrentCurrenciesEvent, CurrentCurrenciesState> {
  CurrentCurrenciesBloc() : super(CurrentCurrenciesInitial()) {
    on<SetCurrentCurrencies>(setCurrentCurrencies);
    on<SetCurrencyFrom>(setCurrencyFrom);
    on<SetCurrencyTo>(setCurrencyTo);
  }

  void setCurrentCurrencies(SetCurrentCurrencies event, Emitter emit) {
    emit(
      const CurrentCurrenciesLoaded(
        from: CurrencyEntity(code: 'USD', name: 'USD'),
        to: CurrencyEntity(code: 'EUR', name: 'EUR'),
      ),
    );
  }

  void setCurrencyFrom(SetCurrencyFrom event, Emitter emit) {
    final s = state as CurrentCurrenciesLoaded;
    emit(s.copyWith(from: event.from));
  }

  void setCurrencyTo(SetCurrencyTo event, Emitter emit) {
    final s = state as CurrentCurrenciesLoaded;
    emit(s.copyWith(to: event.to));
  }
}
