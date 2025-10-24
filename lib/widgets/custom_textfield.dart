import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        prefixIcon: prefixIcon != null
            ? IconButton(
                icon: Icon(prefixIcon, color: Color(0xffED1C24)),
                color: Colors.white70,
                onPressed: () {},
              )
            : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                color: Colors.white70,
                onPressed: () {},
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Colors.white38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
