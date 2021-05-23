import 'package:flutter/material.dart';
import 'package:ta_calc/models/decoder/code_to_list_and_operation_decoder.dart';
import 'package:ta_calc/models/decoder/code_to_list_decoder.dart';
import 'package:ta_calc/resources/enums.dart';
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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MyColor(),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyColor extends MaterialStateColor {
  const MyColor() : super(_defaultColor);

  static const int _defaultColor = 0xcafefeed;
  static const int _pressedColor = 0xdeadbeef;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.grey[200]!;
    }
    return Colors.white;
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
      body: OperationsDecodePage(
        calcMode: CalcMode.decode,
        decoderDelegate: CodeToListDecoder(),
      ),
      // body: NumPad(
      //   onDone: (_) {},
      //   calcMode: CalcMode.decode,
      // ),
      // body: NumPad(),
    );
  }
}
