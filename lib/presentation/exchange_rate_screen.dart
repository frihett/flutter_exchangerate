import 'package:flutter/material.dart';

class ExchangeRateScreen extends StatelessWidget {
  const ExchangeRateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('눈물나는 환율 계산기'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //가격
              children: [
                Text(
                  '가격',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '금액을 입력하세요',
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  items: <String>['USD', 'KRW', 'JPY', 'EUR']
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
    );
  }
}
