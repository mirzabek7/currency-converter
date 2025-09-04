// ignore_for_file: must_be_immutable

part of 'current_currencies_bloc.dart';

sealed class CurrentCurrenciesState extends Equatable {
  const CurrentCurrenciesState();

  @override
  List<Object> get props => [];
}

final class CurrentCurrenciesInitial extends CurrentCurrenciesState {}

class CurrentCurrenciesLoaded extends CurrentCurrenciesState {
  final CurrencyEntity? from;
  final CurrencyEntity? to;

  const CurrentCurrenciesLoaded({this.from, this.to});

  CurrentCurrenciesLoaded copyWith({CurrencyEntity? from, CurrencyEntity? to}) {
    return CurrentCurrenciesLoaded(from: from ?? this.from, to: to ?? this.to);
  }

  @override
  List<Object> get props => [?from, ?to];
}
