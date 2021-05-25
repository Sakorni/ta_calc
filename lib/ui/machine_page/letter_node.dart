import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LetterNode extends StatelessWidget {
  final FocusNode? prevNode;
  final FocusNode currentNode;
  final FocusNode? nextNode;

  final TextEditingController controller;

  const LetterNode(
      {required this.currentNode,
      this.nextNode,
      required this.controller,
      this.prevNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      // height: ResponsiveSize.height(80),
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Color(0xddFA7022),
          primaryColor: Color(0xddFA7022),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          focusNode: currentNode,
          textAlign: TextAlign.center,
          onChanged: (value) {
            if (value.isNotEmpty) {
              currentNode.unfocus();
              FocusScope.of(context).requestFocus(nextNode);
            } else {
              currentNode.unfocus();
              FocusScope.of(context).requestFocus(prevNode);
            }
          },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(2),
          ],
          decoration: InputDecoration(),
        ),
      ),
    );
  }
}
