import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta_calc/resources/enums.dart';
import 'package:ta_calc/ui/calcPage/calcPage.dart';
import 'package:ta_calc/ui/operations_decode_page/decode_provider.dart';
import 'package:ta_calc/ui/operations_decode_page/widgets/result_window.dart';

class OperationsDecodePage extends StatefulWidget {
  @override
  _OperationsDecodePageState createState() => _OperationsDecodePageState();
}

class _OperationsDecodePageState extends State<OperationsDecodePage> {
  final DecodeProvider provider = DecodeProvider();

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: LayoutBuilder(builder: (context, constraints) {
        return ListView(
          children: [
            Container(
                height: constraints.maxHeight * (3 / 8),
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                child: ResultWindow()),
            Container(
              constraints: BoxConstraints(maxHeight: constraints.maxHeight),
              child: NumPad(
                calcMode: CalcMode.decode,
                onDone: provider.decode,
              ),
            ),
          ],
        );
      }),
    );
  }
}
