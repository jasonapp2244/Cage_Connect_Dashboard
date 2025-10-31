import 'package:flutter/material.dart';

class CustomActionButtons extends StatelessWidget {
  bool? isDeactivate = false;
  CustomActionButtons({super.key, this.isDeactivate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isDeactivate == true
            ? IconButton(
                icon: Icon(Icons.edit, color: Colors.grey.shade600),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                iconSize: 20,
              )
            : IconButton(
                icon: Icon(
                  Icons.visibility_outlined,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                iconSize: 20,
              ),

        isDeactivate == true
            ? Container(
                height: 31,
                width: 85,

                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    'Deactivate',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                iconSize: 20,
              ),
      ],
    );
  }
}
