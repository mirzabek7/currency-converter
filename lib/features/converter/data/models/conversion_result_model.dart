import 'package:currency_converter/features/converter/domain/entities/conversion_result_entity.dart';
import 'package:equatable/equatable.dart';

class ConversionResultModel extends ConversionResultEntity with EquatableMixin {
  ConversionResultModel({
    required super.from,
    required super.to,
    required super.rate,
    required super.result,
  });

  factory ConversionResultModel.fromJson(Map<String, dynamic> json) {
    return ConversionResultModel(
      from: json['from'],
      to: json['to'],
      rate: (json['rate'] as num).toDouble(),
      result: (json['result'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'from': from, 'to': to, 'rate': rate, 'result': result};
  }

  @override
  List<Object?> get props => [from, to, rate, result];
}
