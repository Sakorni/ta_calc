import 'package:flutter/material.dart';
import 'package:ta_calc/ui/operations_decode_page/operations_decode_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ТА калькулятор'),
        backgroundColor: Colors.green,
      ),
      body: OperationsDecodePage(),
      // body: NumPad(),
    );
  }
}
