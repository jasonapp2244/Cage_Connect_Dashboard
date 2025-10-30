import 'package:cageconnectdashboard/controller/dashboard_provider.dart';
import 'package:cageconnectdashboard/routes/routes.dart';
import 'package:cageconnectdashboard/screens/responsive_login_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        // Add more providers here if needed
        // ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: MaterialApp(
        title: 'Cage Connect Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),
        initialRoute: AppPages.initial,
        routes: AppPages.routes,
        home: const ResponsiveLoginScreen(),
      ),
    );
  }
}
