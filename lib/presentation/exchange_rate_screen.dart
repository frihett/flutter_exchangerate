import 'package:flutter/material.dart';
import 'package:flutter_exchangerate/presentation/exchange_rate_view_model.dart';

class ExchangeRateScreen extends StatefulWidget {
  ExchangeRateViewModel viewModel = ExchangeRateViewModel();

  ExchangeRateScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeRateScreen> createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen> {
  var textController = TextEditingController();
  dynamic result;
  String? selectedCurrency ;

  void updateUi() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(updateUi);
    widget.viewModel.onSearch('USD');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('눈물나는 환율 계산기'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //가격
                  children: [
                    Text(
                      '가격',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: '딸라를 입력하세요',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //통화
                  children: [
                    Text(
                      '통화',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      value: selectedCurrency,
                      hint: Text('통화를 선택해주세요'),
                      dropdownColor: Colors.yellow,
                      items: <String>['KRW']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        selectedCurrency = value;

                        result = widget.viewModel.exchangeRateInfo
                                ?.conversionRates?[value!] *
                            double.parse(textController.text);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text('${result ?? '값 찾아 오는 중.'}'),
        ],
      ),
    );
  }
}
