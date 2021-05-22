import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton({
    required this.label,
    required this.onTap,
  });
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 2),
        ],
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: onTap,
        child: Center(
            child: Text(
          label,
          style: TextStyle(fontSize: 24, color: Colors.black),
        )),
      ),
    );
  }
}
