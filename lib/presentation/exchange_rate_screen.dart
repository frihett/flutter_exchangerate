import 'package:flutter/material.dart';
import 'package:flutter_exchangerate/presentation/exchange_rate_view_model.dart';
import 'package:provider/provider.dart';

class ExchangeRateScreen extends StatefulWidget {
  // 주입 받는 것들 정보들
  ExchangeRateScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ExchangeRateScreen> createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen> {
  var textController = TextEditingController();
  dynamic result;
  String? selectedCurrency;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => {context.read()});
    // 정상 작동하는 코드, 컨텍스트는 initState 할떄 생긱는것이 아니라 빌드할때
    // 생기기 때문.
    context.read<ExchangeRateViewModel>().onSearch('USD');
    // 위젯트리안에서 위젯의 위치를 아는놈
    // addListener 를 provider가 역할을 해줌
    // changenotifier 와 세트 , 뷰모델이 변화가 생기면 그 안에 있는 함수를 실행
    // addListener 받는 친구
    // widget.viewModel.onSearch('USD'); 생성자를 통해서 가져오는 방법
  }

  // methods must have an explicit list of parameters.

  @override
  Widget build(BuildContext context) {
    // 뷰모델에 접근할수 있는, 상태가 변하는 걸 담는
    final viewModel = context.watch<ExchangeRateViewModel>();
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
                      items: <String>[...viewModel.currencyList ?? []]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        selectedCurrency = value;

                        result = viewModel
                                .exchangeRateInfo?.conversionRates[value!] *
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
} // ??
