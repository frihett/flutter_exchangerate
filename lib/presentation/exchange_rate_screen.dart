import 'package:flutter/material.dart';
import 'package:flutter_exchangerate/data/data_source/exchange_rate_api.dart';
import 'package:flutter_exchangerate/data/mapper/exchange_rate_mapper.dart';
import 'package:flutter_exchangerate/data/repository/exchange_rate_repo.dart';
import 'package:flutter_exchangerate/data/repository/exchange_rate_repo_impl.dart';
import 'package:flutter_exchangerate/presentation/exchange_rate_view_model.dart';

class ExchangeRateScreen extends StatefulWidget {
  ExchangeRateViewModel viewModel = ExchangeRateViewModel();


  ExchangeRateScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeRateScreen> createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen> {
  var textController = TextEditingController();

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
                      items: <String>['KRW']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // 선택된 통화 처리
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
              '${((widget.viewModel.exchangeRateInfo?.conversionRates?['KRW']) * double.parse(textController.text)).toString() ?? '값 찾아 오는 중.'}'),
        ],
      ),
    );
  }
}
