import 'package:flutter/material.dart';

class CustomStatusBadge extends StatelessWidget {
  final String status;

  const CustomStatusBadge(this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    final isActive = status == 'Active';
    return Text(
      status,
      style: TextStyle(
        color: isActive ? Colors.green : Colors.red,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
