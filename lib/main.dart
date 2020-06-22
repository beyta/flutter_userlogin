import 'package:flutter/material.dart';
import 'package:flutteruserlogin/screen/dashboard_screen.dart';
import 'package:flutteruserlogin/screen/login_screen.dart';
import 'package:flutteruserlogin/screen/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Login Demo',
      initialRoute: LoadingScreen.id,
      routes: {
        LoginScreen.id : (context) => LoginScreen(),
        LoadingScreen.id : (context) => LoadingScreen(),
        DashboardScreen.id : (context) => DashboardScreen(),
      },
    );
  }
}
