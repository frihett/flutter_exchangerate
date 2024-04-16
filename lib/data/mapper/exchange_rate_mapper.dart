import 'package:flutter_exchangerate/data/dto/exchange_rate_dto.dart';
import 'package:flutter_exchangerate/data/model/exchange_rate.dart';

extension ExchangeRateDtoToExchangeRate on ExchangeRateDto {
  ExchangeRate toExchangeRate() {
    return ExchangeRate(
      timeLastUpdateUtc: timeLastUpdateUtc ?? '',
      conversionRates: conversionRates ?? {},
    );
  }
}
