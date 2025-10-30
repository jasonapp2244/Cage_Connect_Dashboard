import 'package:cageconnectdashboard/screens/view/dashboard/main/dashboard_mobile_screen.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/main/dashboard_screen.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/main/dashboard_tablet_screen.dart';
import 'package:cageconnectdashboard/utils/dimension.dart';
import 'package:flutter/material.dart';

class DashboardResponsiveScreen extends StatelessWidget {
  const DashboardResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Dimension.tablet) {
          // Desktop
          return DashboardScreen();
        } else if (constraints.maxWidth >= Dimension.mobile) {
          // Tablet
          return DashboardTabletScreen(); // You can create a DashboardTabletScreen if needed
        } else {
          // Mobile
          return DashboardMobileScreen();
        }
      },
    );
  }
}
