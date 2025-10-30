import 'package:cageconnectdashboard/screens/view/dashboard/user_management/users_mobile_view.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/user_management/users_tablet_view.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/user_management/users_web_view.dart';
import 'package:cageconnectdashboard/utils/dimension.dart';
import 'package:flutter/material.dart';

class ResponsiveUsersScreen extends StatelessWidget {
  const ResponsiveUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Mobile view: width < 600px
        if (constraints.maxWidth < Dimension.mobile) {
          return const UsersMobileView();
        }
        // Tablet view: width between 600px and 1024px
        else if (constraints.maxWidth < Dimension.tablet) {
          return const UsersTabletView();
        }
        // Web view: width >= 1024px
        else {
          return const UsersWebView();
        }
      },
    );
  }
}
