import 'package:flutter/material.dart';

///Item for displaying history of calculation.
class OperationItem extends StatelessWidget {
  final String source;
  final String result;

  const OperationItem({
    Key? key,
    required this.source,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            source,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          Text(
            result,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
