import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomHeaderCell extends StatelessWidget {
  final String? text;
  final double? width;

  const CustomHeaderCell({this.text, this.width});

  @override
  Widget build(BuildContext context) {
    var adaptive = Adaptive(context);
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
        child: Text(
          text ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: adaptive.fontSize(11),
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
