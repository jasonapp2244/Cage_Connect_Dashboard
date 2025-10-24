import 'package:cageconnectdashboard/screens/responsive_login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cage Connect Dashboard',
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),
      home: const ResponsiveLoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
