import 'package:flutter/material.dart';
import 'package:flutter_exchangerate/data/model/exchange_rate.dart';
import 'package:flutter_exchangerate/data/repository/exchange_rate_repo.dart';
import 'package:flutter_exchangerate/data/repository/exchange_rate_repo_impl.dart';

class ExchangeRateViewModel with ChangeNotifier {
  final ExchangeRateRepository _exchangeRateRepository =
      ExchangeRateRepositoryImpl();

  ExchangeRateViewModel() {
    //Non-nullable instance field 'currencyList' must be initialized. (Documentation)
    onSearch('USD');
    print('$_exchangeRateInfo');
  }

  ExchangeRate? _exchangeRateInfo;

  ExchangeRate? get exchangeRateInfo => _exchangeRateInfo;

  void onSearch(String currency) async {
    _exchangeRateInfo = await _exchangeRateRepository.getExchangeInfo(currency);

    currencyList = _exchangeRateInfo
        ?.conversionRates.keys.toList() ?? [];
    notifyListeners();
  }
  List<String>?  currencyList ;
  //he instance member '_exchangeRateInfo' can't be accessed in an initializer.
// (Documentation)  Try replacing the reference to the instance member
// with a different expression
// A value of type 'List<String>?' can't be assigned to a variable
// of type 'List<String>'. (Documentation)  Try changing the type of the variable,
// or casting the right-hand type to 'List<String>'.
}
