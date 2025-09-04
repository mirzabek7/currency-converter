part of 'currencies_bloc.dart';

sealed class CurrenciesState extends Equatable {
  const CurrenciesState();

  @override
  List<Object> get props => [];
}

final class CurrenciesInitial extends CurrenciesState {}

final class CurrenciesLoading extends CurrenciesState {}

final class CurrenciesLoaded extends CurrenciesState {
  final List<CurrencyEntity> currencies;

  const CurrenciesLoaded(this.currencies);
}

final class CurrenciesError extends CurrenciesState {
  final String message;

  const CurrenciesError(this.message);
}
