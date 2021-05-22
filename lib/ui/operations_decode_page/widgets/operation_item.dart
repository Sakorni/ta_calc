import 'package:flutter/material.dart';
import 'package:ta_calc/models/operations/abstract/reg_operation.dart';

class OperationItem extends StatelessWidget {
  final List<int> codes;
  final RegOpeartion operation;

  const OperationItem({
    Key? key,
    required this.codes,
    required this.operation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            codes.toString(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text(
            operation.getOpeartionView(),
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
