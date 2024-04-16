import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/exchange_rate_dto.dart';

class ExchangeRateApi {
  Future<ExchangeRateDto> getExchangeRate(String currency) async {
    final response = await http.get(Uri.parse(
        'https://v6.exchangerate-api.com/v6/30904c58ba84c98bacffddf8/latest/$currency'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      return ExchangeRateDto.fromJson(jsonData);
    } else {
      throw Exception('Error');
    }
  }
}
