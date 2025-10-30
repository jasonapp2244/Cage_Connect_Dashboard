import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomProfileWidget extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String avatarImagePath;
  final IconData notificationIcon;
  final Color notificationIconColor;

  const CustomProfileWidget({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.avatarImagePath,
    this.notificationIcon = Icons.notifications_none,
    this.notificationIconColor = Colors.black54, // Default color
  });

  @override
  Widget build(BuildContext context) {
    var adaptive = Adaptive(context);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Keep the row content snug
        children: <Widget>[
          Container(
            padding: adaptive.paddingOnly(left: 2, top: 2, right: 2, bottom: 2),
            decoration: BoxDecoration(
              color: AppColors.bgColor, // Light gray background
              shape: BoxShape.circle,
            ),
            child: Icon(
              notificationIcon,
              color: notificationIconColor,
              size: 16,
            ),
          ),

          adaptive.horizontalSpace(8),

          Row(
            children: <Widget>[
              // Avatar
              CircleAvatar(
                radius: 25,

                backgroundImage: AssetImage(avatarImagePath),
              ),

              adaptive.horizontalSpace(4),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Name
                  Text(
                    userName, // Use the parameter
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: adaptive.fontSize(14),

                      color: Colors.black,
                    ),
                  ),
                  // Email
                  Text(
                    userEmail, // Use the parameter
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: adaptive.fontSize(14),
                      color: Color(0xff6C6C6C),
                    ),
                  ),
                ],
              ),
            ],
          ),

          adaptive.horizontalSpace(2),

          const Icon(Icons.arrow_drop_down, color: Colors.black, size: 24),
        ],
      ),
    );
  }
}
