import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:flutter/material.dart';

class CustomInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final Color color;

  const CustomInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final adaptive = Responsive.of(context);
    return Container(
      // height: adaptive.screenWidth > 1212
      //     ? adaptive.height(17)
      //     : adaptive.height(17), // instead of 160
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: adaptive.fontSize(16),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.48,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: adaptive.fontSize(40),
              fontFamily: 'Clash Display',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: adaptive.fontSize(14),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.42,
            ),
          ),
        ],
      ),
    );
  }
}
