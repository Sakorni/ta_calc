import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta_calc/resources/enums.dart';
import 'package:ta_calc/ui/calcPage/calc_page_provider.dart';
import 'button/button.dart';

class NumPad extends StatelessWidget {
  final void Function(String) onDone;
  final CalcMode calcMode;
  NumPad({required this.onDone, required this.calcMode});
  @override
  Widget build(BuildContext context) {
    var provider = CalcPageProvider(onDone: onDone, calcMode: calcMode);
    return ChangeNotifierProvider.value(
      value: provider,
      child: Column(
        children: [
          InputField(),
          Expanded(
            child: CalcButtons(),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  label: 'C',
                  onTap: provider.deleteAllPressed,
                ),
                CalculatorButton(
                  label: '=',
                  onTap: provider.calculate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InputField extends StatefulWidget {
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late CalcPageProvider provider;

  @override
  void didChangeDependencies() {
    provider = context.read<CalcPageProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Text(
          provider.value,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

class CalcButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CalcPageProvider>(context, listen: false);
    List<Widget> buttons = [];
    for (var number = 7; number < 10; number++) {
      buttons.add(
        CalculatorButton(
          label: number.toString(),
          onTap: () {
            provider.numberPressed(number.toString());
          },
        ),
      );
    }
    for (var number = 4; number < 7; number++) {
      buttons.add(
        CalculatorButton(
          label: number.toString(),
          onTap: () {
            provider.numberPressed(number.toString());
          },
        ),
      );
    }
    for (var number = 1; number < 4; number++) {
      buttons.add(
        CalculatorButton(
          label: number.toString(),
          onTap: () {
            provider.numberPressed(number.toString());
          },
        ),
      );
    }
    buttons.add(
      CalculatorButton(
        label: ',',
        onTap:
            provider.calcMode == CalcMode.encode ? provider.addPressed : null,
      ),
    );
    buttons.add(
      CalculatorButton(
        label: '0',
        onTap: () {
          provider.numberPressed('0');
        },
      ),
    );
    buttons.add(
      CalculatorButton(
        label: '⌫',
        onTap: provider.deletePressed,
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
