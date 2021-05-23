import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton({
    required this.label,
    this.onTap,
  });
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
