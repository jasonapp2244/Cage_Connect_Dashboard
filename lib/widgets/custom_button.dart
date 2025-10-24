import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool loading;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 30,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // full width button
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: loading ? null : onPressed,
        child: loading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
