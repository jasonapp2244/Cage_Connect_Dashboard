import 'package:flutter/material.dart';

class CustomActionButtons extends StatelessWidget {
  const CustomActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.visibility_outlined, color: Colors.grey.shade600),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          iconSize: 20,
        ),
        IconButton(
          icon: Icon(Icons.delete_outline, color: Colors.grey.shade600),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          iconSize: 20,
        ),
      ],
    );
  }
}
