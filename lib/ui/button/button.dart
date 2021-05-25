import 'package:flutter/material.dart';
import 'package:ta_calc/main.dart';

enum ButtonType {
  regular,
  done,
  cancel,
}

class CalculatorButton extends StatelessWidget {
  final ButtonType type;
  CalculatorButton({
    required this.label,
    this.onTap,
    this.type = ButtonType.regular,
  });
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    late final ButtonStyle? style;
    switch (type) {
      case ButtonType.regular:
        {
          style = Theme.of(context).elevatedButtonTheme.style;
          break;
        }
      case ButtonType.done:
        style = Theme.of(context).elevatedButtonTheme.style?.copyWith(
              overlayColor: const DoneButtonColor(),
              backgroundColor: const DoneButtonColor(),
            );
        break;
      case ButtonType.cancel:
        style = Theme.of(context).elevatedButtonTheme.style?.copyWith(
              overlayColor: const CancelButtonColor(),
              backgroundColor: const CancelButtonColor(),
            );
        break;
    }
    return ElevatedButton(
      onPressed: onTap,
      style: style,
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
