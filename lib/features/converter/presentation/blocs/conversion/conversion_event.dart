part of 'conversion_bloc.dart';

sealed class ConversionEvent extends Equatable {
  const ConversionEvent();

  @override
  List<Object> get props => [];
}

class ConvertEvent extends ConversionEvent {
  final String from;
  final String to;
  final double amount;

  const ConvertEvent({
    required this.from,
    required this.to,
    required this.amount,
  });
}
