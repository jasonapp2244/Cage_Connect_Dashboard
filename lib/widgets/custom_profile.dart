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
    this.notificationIconColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    var adaptive = Adaptive(context);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.center, // ✅ vertically center everything
        children: <Widget>[
          Container(
            padding: adaptive.paddingOnly(left: 2, top: 2, right: 2, bottom: 2),
            decoration: BoxDecoration(
              color: AppColors.bgColor,
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
            crossAxisAlignment: CrossAxisAlignment.center, // ✅ important
            children: <Widget>[
              // Avatar
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(avatarImagePath),
              ),

              adaptive.horizontalSpace(6),

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // ✅ align text left
                mainAxisAlignment:
                    MainAxisAlignment.center, // ✅ center vertically with avatar
                children: <Widget>[
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: adaptive.fontSize(14),
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    userEmail,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: adaptive.fontSize(12),
                      color: const Color(0xff6C6C6C),
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
