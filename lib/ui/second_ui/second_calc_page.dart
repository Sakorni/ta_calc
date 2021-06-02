import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta_calc/ui/second_ui/second_provider.dart';
import 'package:ta_calc/ui/second_ui/widgets/keyboard.dart';

class CalcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider(
            create: (_) => SecondProvider(),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Consumer<SecondProvider>(
                    builder: (context, calc, child) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10.0),
                        child: Text(
                          calc.line,
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: KeyBoard(),
                    flex: 1,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
