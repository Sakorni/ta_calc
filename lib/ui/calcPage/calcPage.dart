import 'package:flutter/material.dart';
import 'package:ta_calc/ui/num_pad_delegate.dart';
import 'button/button.dart';
import 'buttonHandler.dart';

class NumPad extends StatelessWidget {
  final NumPadDelegate handler;
  NumPad({required this.handler});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(),
        Expanded(
          child: CalcButtons(
            addPressed: handler.addPressed,
            deletePressed: handler.deletePressed,
            numberPressed: handler.numberPressed,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                label: 'C',
                onTap: MainHandler().deleteAllPressed,
              ),
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
  final NumberHandler numberPressed;
  final AddHandler addPressed;
  final DeleteHandler deletePressed;
  CalcButtons(
      {required this.numberPressed,
      required this.addPressed,
      required this.deletePressed});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    for (var number = 7; number < 10; number++) {
      buttons.add(
        CalculatorButton(
          label: number.toString(),
          onTap: () {
            numberPressed(number);
          },
        ),
      );
    }
    for (var number = 4; number < 7; number++) {
      buttons.add(
        CalculatorButton(
          label: number.toString(),
          onTap: () {
            numberPressed(number);
          },
        ),
      );
    }
    for (var number = 1; number < 4; number++) {
      buttons.add(
        CalculatorButton(
          label: number.toString(),
          onTap: () {
            numberPressed(number);
          },
        ),
      );
    }
    buttons.add(
      CalculatorButton(
        label: ',',
        onTap: addPressed,
      ),
    );
    buttons.add(
      CalculatorButton(
        label: '0',
        onTap: () {
          numberPressed(0);
        },
      ),
    );
    buttons.add(
      CalculatorButton(
        label: '⌫',
        onTap: deletePressed,
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
