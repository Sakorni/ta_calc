import 'package:flutter/material.dart';
import 'button/button.dart';
import 'buttonHandler.dart';

class NumPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(),
        SizedBox(height: 400, child: CalcButtons()),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CalculatorButton(
                label: '=',
                onTap: MainHandler().calculate,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InputField extends StatefulWidget {
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController controller = MainHandler().controller;

  // @override
  // void didChangeDependencies() {
  //   controller.text = MainHandler().valuesAsString();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
        ),
        controller: controller,
        enabled: false,
        readOnly: true,
      ),
    );
  }
}

class CalcButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var handler = MainHandler();
    List<Widget> buttons = [];
    for (var number = 7; number < 10; number++) {
      buttons.add(
        CalculatorButton(
          label: number.toString(),
          onTap: () {
            handler.numberPressed(number);
          },
        ),
      );
    }
    for (var number = 4; number < 7; number++) {
      buttons.add(
        CalculatorButton(
          label: number.toString(),
          onTap: () {
            handler.numberPressed(number);
          },
        ),
      );
    }
    for (var number = 1; number < 4; number++) {
      buttons.add(
        CalculatorButton(
          label: number.toString(),
          onTap: () {
            handler.numberPressed(number);
          },
        ),
      );
    }
    buttons.add(
      CalculatorButton(
        label: ',',
        onTap: handler.addPressed,
      ),
    );
    buttons.add(
      CalculatorButton(
        label: '0',
        onTap: () {
          handler.numberPressed(0);
        },
      ),
    );
    buttons.add(
      CalculatorButton(
        label: '⌫',
        onTap: handler.deletePressed,
      ),
    );
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(20),
      childAspectRatio: (1.5),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: buttons,
    );
  }
}
