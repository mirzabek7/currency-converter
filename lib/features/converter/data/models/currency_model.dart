import 'package:currency_converter/features/converter/domain/entities/currency_entity.dart';
import 'package:equatable/equatable.dart';

class CurrencyModel extends CurrencyEntity with EquatableMixin {
  const CurrencyModel({required super.code, required super.name});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(code: json['code'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'code': code, 'name': name};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [code, name];
}
