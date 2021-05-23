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
      child: SizedBox(
        height: 700,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 600),
          child: ListView(
            shrinkWrap: true,
            children: [
              InputField(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CalcButtons(),
              ),
            ],
          ),
        ),
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
    provider = context.watch<CalcPageProvider>();
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          padding: const EdgeInsets.symmetric(vertical: 20),
          childAspectRatio: (1.5),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: buttons,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: CalculatorButton(
                  type: ButtonType.cancel,
                  label: 'C',
                  onTap: provider.deleteAllPressed,
                ),
              ),
            ),
            Spacer(),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: CalculatorButton(
                  type: ButtonType.done,
                  label: '=',
                  onTap: provider.calculate,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
