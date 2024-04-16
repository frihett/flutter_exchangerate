import '../model/exchange_rate.dart';

abstract interface class ExchangeRateRepository {
  Future<ExchangeRate> getExchangeInfo(String currency);
}
