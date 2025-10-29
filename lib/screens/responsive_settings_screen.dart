import 'package:cageconnectdashboard/screens/view/dashboard/settings_mobile_view.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/settings_tablet_view.dart';
import 'package:cageconnectdashboard/screens/view/dashboard/settings_web_view.dart';
import 'package:cageconnectdashboard/utils/dimension.dart';
import 'package:flutter/material.dart';

class ResponsiveSettingsScreen extends StatelessWidget {
  const ResponsiveSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Mobile view: width < 600px
        if (constraints.maxWidth < Dimension.mobile) {
          return const SettingsMobileView();
        }
        // Tablet view: width between 600px and 1024px
        else if (constraints.maxWidth < Dimension.tablet) {
          return const SettingsTabletView();
        }
        // Web view: width >= 1024px
        else {
          return const SettingsWebView();
        }
      },
    );
  }
}

