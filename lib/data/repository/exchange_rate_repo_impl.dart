import 'package:flutter_exchangerate/data/data_source/exchange_rate_api.dart';
import 'package:flutter_exchangerate/data/mapper/exchange_rate_mapper.dart';
import 'package:flutter_exchangerate/data/model/exchange_rate.dart';
import 'package:flutter_exchangerate/data/repository/exchange_rate_repo.dart';

class ExchangeRateRepositoryImpl implements ExchangeRateRepository {
  final ExchangeRateApi _api = ExchangeRateApi();

  @override
  Future<ExchangeRate> getExchangeInfo(String currency) async {
    final result = await _api.getExchangeRate(currency);
    return result.toExchangeRate();
  }
}

void main() async {
  ExchangeRateRepository exchangeRateRepository = ExchangeRateRepositoryImpl();
  final result = await exchangeRateRepository.getExchangeInfo('KRW');
  print(result);
}
