import 'package:flutter/material.dart';
import 'package:flutter_exchangerate/presentation/exchange_rate_screen.dart';
import 'package:flutter_exchangerate/presentation/exchange_rate_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        child:
          ExchangeRateScreen(),
      create: (_)=> ExchangeRateViewModel() ), // 뷰모델을 만들어준다
    );
  }
}
