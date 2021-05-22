import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta_calc/ui/operations_decode_page/decode_provider.dart';
import 'package:ta_calc/ui/operations_decode_page/widgets/result_window.dart';

class OperationsDecodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DecodeProvider provider = DecodeProvider();
    return ChangeNotifierProvider.value(
      value: provider,
      child: Column(
        children: [
          Expanded(
            child: Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                child: ResultWindow()),
            flex: 3,
          ),
          //TODO: Приделать нампад
          Expanded(
            flex: 5,
            child: Center(
              child: Text("Lubba"),
            ),
          ),
          TextButton(
            onPressed: () => provider.decode(
              BigInt.parse("115046316000"),
            ),
            child: Text("Tap me bro"),
          ),
        ],
      ),
    );
  }
}
