import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta_calc/resources/strings.dart';
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
    for (int i = 0; i < provider.sources.length; ++i) {
      res.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: OperationItem(
            source: provider.sources[i].toString(),
            result: provider.results[i].toString(),
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
        children: [
          const Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              AppStrings.result_caption,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          ...getItems()
        ],
      ),
    );
  }
}
