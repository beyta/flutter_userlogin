import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutteruserlogin/screen/dashboard_screen.dart';
import 'package:flutteruserlogin/screen/login_screen.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = 'loading_screen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autoLoginCheck();
  }

  void autoLoginCheck() async {
    final SharedPreferences localdb = await SharedPreferences.getInstance();
    final String ldbUsername = localdb.getString('ldbUsername');
    final String ldbToken = localdb.getString('ldbToken');

    if (ldbUsername != null && ldbToken != null) {
      Navigator.pushNamed(context, DashboardScreen.id);
    }
    else {
      Navigator.pushNamed(context, LoginScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.black45,
          size: 30.0,
        ),
      ),
    );
  }
}
