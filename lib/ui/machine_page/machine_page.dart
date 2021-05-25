import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta_calc/resources/enums.dart';
import 'package:ta_calc/ui/button/button.dart';
import 'package:ta_calc/ui/machine_page/letter_node.dart';
import 'package:ta_calc/ui/machine_page/machine_page_provider.dart';

class MachineCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MachinePageProvider(), child: MachineButtons());
  }
}

class MachineButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    for (var ind = 0; ind < 5; ind++) {
      var oper = Operation.values[ind];
      buttons.add(
        CalculatorButton(
          label: oper.asString(),
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  buttonPadding: EdgeInsets.zero,
                  title: Center(child: Text('Операция ' + oper.asString())),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RegOpFilling(oper),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          TextButton(
                            child: const Text('Отменить'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Spacer(),
                          TextButton(
                            child: const Text('Подтвердить'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );
    }

    buttons.add(
      CalculatorButton(
        label: 'DEL',
        // onTap:
        //     provider.chtoto,
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...buttons,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: CalculatorButton(
                  type: ButtonType.cancel,
                  label: 'C',
                  // onTap: provider.deleteAllPressed,
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
                  // onTap: provider.calculate,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RegOpFilling extends StatefulWidget {
  final Operation operation;
  RegOpFilling(this.operation);
  @override
  _RegOpFillingState createState() => _RegOpFillingState();
}

class _RegOpFillingState extends State<RegOpFilling> {
  @override
  Widget build(BuildContext context) {
    var pattern = widget.operation.getPattern();

    List<FocusNode> nodes = [];
    List<TextEditingController> controllers = [];
    List<Widget> children = [];
    for (var i = 0; i < pattern.length; i++) {
      nodes.add(FocusNode());
      controllers.add(TextEditingController());
    }

    // STOP oper
    if (pattern.length == 1) {
      children.add(
        Text(
          pattern[0],
        ),
      );
    }
    //End STOP oper section

    // INS, INC, DEC opers
    else if (pattern.length == 2) {
      children.add(
        Text(
          pattern[0],
        ),
      );
      children.add(
        LetterNode(
          currentNode: nodes[0],
          controller: controllers[0],
          nextNode: nodes[1],
        ),
      );
      children.add(
        Text(
          pattern[1],
        ),
      );
      children.add(
        LetterNode(
          currentNode: nodes[1],
          controller: controllers[1],
          prevNode: nodes[0],
        ),
      );
    }
    //End INS, INC, DEC oper section

    // IF oper
    else {
      children.add(
        Text(
          pattern[0],
        ),
      );
      children.add(
        LetterNode(
          currentNode: nodes[0],
          controller: controllers[0],
          nextNode: nodes[1],
        ),
      );
      children.add(
        Text(
          pattern[1],
        ),
      );
      children.add(
        LetterNode(
          currentNode: nodes[1],
          controller: controllers[1],
          prevNode: nodes[0],
          nextNode: nodes[2],
        ),
      );

      children.add(
        Text(
          pattern[2],
        ),
      );
      children.add(
        LetterNode(
          currentNode: nodes[2],
          controller: controllers[2],
          prevNode: nodes[1],
        ),
      );
    }
    //End IF oper section

    return Row(
      children: children,
    );
  }
}
