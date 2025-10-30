import 'package:cageconnectdashboard/screens/dashboard/dashoard_web/dashboard_mobile_screen.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/main/dashboard_mobile_screen.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/main/dashboard_tablet_screen.dart';
import 'package:cageconnectdashboard/utils/dimension.dart';
import 'package:flutter/material.dart';

// Import your screens
import 'dashboard_screen.dart';

class DashboardResponsive extends StatelessWidget {
  const DashboardResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Dimension.tablet) {
          // Desktop
          return const DashboardScreen();
        } else if (constraints.maxWidth >= Dimension.mobile) {
          // Tablet
          return const DashboardTabletScreen(); // You can create a DashboardTabletScreen if needed
        } else {
          return const DashboardMobileScreen();
          // Mobile
          //  return const DashboardMobileScreen();
        }
      },
    );
  }
}
