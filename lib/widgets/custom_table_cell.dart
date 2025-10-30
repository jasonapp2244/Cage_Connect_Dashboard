import 'package:flutter/material.dart';

class CustomTableCell extends StatelessWidget {
  final Widget child;

  const CustomTableCell(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16.0), child: child);
  }
}
