import 'package:flutter/material.dart';
import 'package:flutter_exchangerate/data/model/exchange_rate.dart';
import 'package:flutter_exchangerate/data/repository/exchange_rate_repo.dart';
import 'package:flutter_exchangerate/data/repository/exchange_rate_repo_impl.dart';

class ExchangeRateViewModel with ChangeNotifier {
  final ExchangeRateRepository _exchangeRateRepository =
      ExchangeRateRepositoryImpl();






  ExchangeRateViewModel() {
    onSearch('USD');
    print('$_exchangeRateInfo');
  }

  ExchangeRate? _exchangeRateInfo;

  ExchangeRate? get exchangeRateInfo => _exchangeRateInfo;

  void onSearch(String currency) async {
    _exchangeRateInfo = await _exchangeRateRepository.getExchangeInfo(currency);
    notifyListeners();
  }
}
