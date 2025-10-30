import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:flutter/material.dart';

class CustomFilterPill extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CustomFilterPill({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var adaptive = Adaptive(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffED1C24) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xffED1C24) : Colors.grey.shade300,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey.shade600,
          fontSize: adaptive.fontSize(13),
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}
