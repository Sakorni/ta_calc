import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta_calc/models/decoder/code_to_list_decoder.dart';
import 'package:ta_calc/resources/enums.dart';
import 'package:ta_calc/ui/calcPage/calcPage.dart';
import 'package:ta_calc/ui/operations_decode_page/decode_provider.dart';
import 'package:ta_calc/ui/operations_decode_page/widgets/result_window.dart';

class OperationsDecodePage extends StatefulWidget {
  @override
  _OperationsDecodePageState createState() => _OperationsDecodePageState();
}

class _OperationsDecodePageState extends State<OperationsDecodePage> {
  final DecodeProvider provider = DecodeProvider(CodeToListAndOperation());

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: PageView(
        children: [
          NumPad(
            calcMode: CalcMode.decode,
            onDone: provider.decode,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                // border: Border.all(style: BorderStyle.solid),
                ),
            child: ResultWindow(),
          ),
        ],
      ),
    );
  }
}
