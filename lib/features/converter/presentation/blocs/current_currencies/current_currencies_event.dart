part of 'current_currencies_bloc.dart';

sealed class CurrentCurrenciesEvent extends Equatable {
  const CurrentCurrenciesEvent();

  @override
  List<Object> get props => [];
}

class SetCurrentCurrencies extends CurrentCurrenciesEvent {}

class SetCurrencyFrom extends CurrentCurrenciesEvent {
  final CurrencyEntity from;

  const SetCurrencyFrom(this.from);
}

class SetCurrencyTo extends CurrentCurrenciesEvent {
  final CurrencyEntity to;

  const SetCurrencyTo(this.to);
}
