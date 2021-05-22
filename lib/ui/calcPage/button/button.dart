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
    return Ink(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 2),
        ],
        color: onTap != null ? Colors.white : Colors.grey[350],
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
