import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  String? hintText;
  double? width;
  Color? hintColor;

  CustomSearchBar({super.key, this.hintText, this.width, this.hintColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 400,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.textColor),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: hintColor ?? Colors.white,
                filled: true,
                hintText: hintText.toString(),
                hintStyle: TextStyle(color: Color(0xff6C6C6C), fontSize: 14),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
