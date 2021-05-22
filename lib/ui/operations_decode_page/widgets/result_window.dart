import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta_calc/ui/operations_decode_page/decode_provider.dart';
import 'package:ta_calc/ui/operations_decode_page/widgets/operation_item.dart';

class ResultWindow extends StatefulWidget {
  @override
  _ResultWindowState createState() => _ResultWindowState();
}

class _ResultWindowState extends State<ResultWindow> {
  late DecodeProvider provider;

  @override
  void didChangeDependencies() {
    provider = context.watch<DecodeProvider>();
    super.didChangeDependencies();
  }

  List<Widget> getItems() {
    List<Widget> res = [];
    for (int i = 0; i < provider.operations.length; ++i) {
      res.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: OperationItem(
            codes: provider.codes[i],
            operation: provider.operations[i],
          ),
        ),
      );
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: getItems(),
      ),
    );
  }
}
