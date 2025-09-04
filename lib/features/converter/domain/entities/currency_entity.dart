import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final String code;
  final String name;

  const CurrencyEntity({required this.code, required this.name});

  @override
  List<Object?> get props => [code, name];
}
