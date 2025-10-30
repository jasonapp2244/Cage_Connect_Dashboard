import 'package:cageconnectdashboard/screens/view/authentication/login_mobile_view.dart';
import 'package:cageconnectdashboard/screens/view/authentication/login_tablet_view.dart';
import 'package:cageconnectdashboard/screens/view/authentication/login_web_view.dart';
import 'package:cageconnectdashboard/utils/dimension.dart';
import 'package:flutter/material.dart';

class ResponsiveLoginScreen extends StatelessWidget {
  const ResponsiveLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= Dimension.tablet) {
          // Web/Desktop
          return const LoginWebView();
        } else if (constraints.maxWidth >= Dimension.mobile &&
            constraints.maxWidth < Dimension.tablet) {
          // Tablet
          return const LoginTabletView();
        } else {
          // Mobile
          return const LoginMobileView();
        }
      },
    );
  }
}
