import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:provider/provider.dart';
import 'package:ta_calc/resources/strings.dart';
import 'package:ta_calc/ui/second_ui/second_provider.dart';

class KeyBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var calc = context.watch<SecondProvider>();
    var messenger = ScaffoldMessenger.of(context);
    calc.results.listen(
      (result) {
        if (result.isNotEmpty) {
          messenger.hideCurrentSnackBar();
          messenger.showSnackBar(
            SnackBar(
              padding: EdgeInsets.symmetric(horizontal: 20),
              content: Text(result),
              duration: Duration(seconds: 5),
              backgroundColor: Colors.grey[800]!.withOpacity(0.7),
            ),
          );
        }
      },
    );
    return GridButton(
        textStyle: TextStyle(
            color: Colors.black, fontSize: 22, fontFamily: "RobotoMono"),
        onPressed: (val) {
          messenger.hideCurrentSnackBar();
          FocusScope.of(context).unfocus();
          calc.buttonPressed(val);
        },
        items: [
          [
            GridButtonItem(
              title: "√",
              value: "",
            ),
            GridButtonItem(
              title: "C",
            ),
            GridButtonItem(
              title: "CE",
              value: "C",
            ),
            GridButtonItem(
              title: "⌫",
            ),
          ],
          [
            GridButtonItem(
              title: "^",
            ),
            GridButtonItem(
              title: "/",
            ),
            GridButtonItem(
              title: "%",
            ),
            GridButtonItem(
              title: "1/x",
              value: "",
            ),
          ],
          [
            GridButtonItem(
              title: "7",
              color: Colors.white,
            ),
            GridButtonItem(
              title: "8",
              color: Colors.white,
            ),
            GridButtonItem(
              title: "9",
              color: Colors.white,
            ),
            GridButtonItem(
              title: "×",
            ),
          ],
          [
            GridButtonItem(
              title: "4",
              color: Colors.white,
            ),
            GridButtonItem(
              title: "5",
              color: Colors.white,
            ),
            GridButtonItem(
              title: "6",
              color: Colors.white,
            ),
            GridButtonItem(
              title: "-",
            ),
          ],
          [
            GridButtonItem(
              title: "1",
              color: Colors.white,
            ),
            GridButtonItem(
              title: "2",
              color: Colors.white,
            ),
            GridButtonItem(
              title: "3",
              color: Colors.white,
            ),
            GridButtonItem(
              title: "+",
            ),
          ],
          [
            GridButtonItem(
              title: "000",
              color: Colors.white,
            ),
            GridButtonItem(
              title: "0",
              color: Colors.white,
            ),
            GridButtonItem(
              title: ",",
              color: Colors.white,
            ),
            GridButtonItem(
                title: "=",
                color: Colors.blue,
                textStyle: TextStyle(color: Colors.white, fontSize: 24),
                longPressValue: CalcStrings.transform),
          ],
        ]);
  }
}
