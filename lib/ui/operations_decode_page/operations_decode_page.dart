import 'package:flutter/material.dart';

class OperationsDecodePage extends StatefulWidget {
  @override
  _OperationsDecodePageState createState() => _OperationsDecodePageState();
}

class _OperationsDecodePageState extends State<OperationsDecodePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List<Widget>.generate(
                100,
                (index) => Text("Text#$index"),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text("Lubba"),
          ),
        ),
      ],
    );
  }
}
