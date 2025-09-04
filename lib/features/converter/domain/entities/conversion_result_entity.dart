import 'package:equatable/equatable.dart';

class ConversionResultEntity extends Equatable {
  final String from;
  final String to;
  final double rate;
  final double result;

  const ConversionResultEntity({
    required this.from,
    required this.to,
    required this.rate,
    required this.result,
  });

  @override
  List<Object?> get props => [from, to, rate, result];
}
