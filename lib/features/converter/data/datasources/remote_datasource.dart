import 'package:currency_converter/core/error/exception.dart';
import 'package:currency_converter/features/converter/data/models/conversion_result_model.dart';
import 'package:currency_converter/features/converter/data/models/currency_model.dart';
import 'package:dio/dio.dart';

abstract interface class RemoteDatasource {
  Future<List<CurrencyModel>> getCurrencies();
  Future<ConversionResultModel> convertCurrency({
    required String from,
    required String to,
    required double amount,
  });
}

class RemoteDataSourceImpl implements RemoteDatasource {
  final Dio dio;

  RemoteDataSourceImpl(this.dio);

  static const String baseUrl = "https://api.freecurrencyapi.com/v1";
  static const String apiKey =
      "-----------------------------------------";

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    try {
      final response = await dio.get(
        '$baseUrl/currencies',
        queryParameters: {'apikey': apiKey},
      );
      if (response.statusCode == 200) {
        final data = response.data['data'] as Map<String, dynamic>;

        return data.values.map((value) {
          final json = value as Map<String, dynamic>;
          return CurrencyModel.fromJson(json);
        }).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ConversionResultModel> convertCurrency({
    required String from,
    required String to,
    required double amount,
  }) async {
    try {
      final response = await dio.get(
        '$baseUrl/latest',
        queryParameters: {
          'apikey': apiKey,
          'base_currency': from,
          'currencies': to,
        },
      );

      double rate = (response.data['data'][to] as num).toDouble();
      return ConversionResultModel(
        from: from,
        to: to,
        rate: rate,
        result: amount * rate,
      );
    } catch (e) {
      throw ServerException();
    }
  }
}
