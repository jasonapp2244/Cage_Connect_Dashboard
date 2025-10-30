import 'package:cageconnectdashboard/routes/apppages.dart';
import 'package:cageconnectdashboard/screens/responsive_login_screen.dart';
import 'package:cageconnectdashboard/screens/responsive_home_screen.dart';
import 'package:flutter/material.dart';

class AppPages {
  static const initial = '/login';

  static final Map<String, WidgetBuilder> routes = {
    AppRoutes.login: (context) => const ResponsiveLoginScreen(),
    AppRoutes.home: (context) => ResponsiveHomeScreen(),
  };
}
