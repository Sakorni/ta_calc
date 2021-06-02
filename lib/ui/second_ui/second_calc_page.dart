import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta_calc/ui/second_ui/second_provider.dart';
import 'package:ta_calc/ui/second_ui/widgets/keyboard.dart';

class CalcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ChangeNotifierProvider(
          create: (_) => SecondProvider(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Consumer<SecondProvider>(
                  builder: (context, calc, child) {
                    return Padding(
                        padding:
                            EdgeInsets.only(top: 48, bottom: 32, right: 16),
                        child: Text(
                          calc.line,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontFamily: "Roboto", fontSize: 52),
                        ));
                  },
                ),
                Expanded(
                  child: KeyBoard(),
                  flex: 1,
                ),
              ],
            ),
          ),
        ));
  }
}
