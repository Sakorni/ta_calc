import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta_calc/models/decoder/decoder_delegate.dart';
import 'package:ta_calc/resources/enums.dart';
import 'package:ta_calc/ui/calcPage/calcPage.dart';
import 'package:ta_calc/ui/operations_decode_page/decode_provider.dart';
import 'package:ta_calc/ui/operations_decode_page/widgets/result_window.dart';

class OperationsDecodePage extends StatefulWidget {
  final CalcMode calcMode;
  final DecoderDelegate decoderDelegate;

  const OperationsDecodePage({
    Key? key,
    required this.calcMode,
    required this.decoderDelegate,
  }) : super(key: key);
  @override
  _OperationsDecodePageState createState() => _OperationsDecodePageState();
}

class _OperationsDecodePageState extends State<OperationsDecodePage> {
  late final DecodeProvider provider;

  @override
  void initState() {
    super.initState();
    provider = DecodeProvider(widget.decoderDelegate);
  }

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      builder: (context, child) {
        provider.exceptions.listen((event) {
          if (event) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(provider.exceptionCaption),
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
            );
          }
        });
        return child!;
      },
      child: PageView(
        children: [
          NumPad(
            calcMode: widget.calcMode,
            onDone: provider.decode,
          ),
          ResultWindow(),
        ],
      ),
    );
  }
}
