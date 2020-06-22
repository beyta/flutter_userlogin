import 'package:flutter/material.dart';
import 'package:flutteruserlogin/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutteruserlogin/components/acwButton.dart';

class DashboardScreen extends StatefulWidget {
  static const id = 'dashboard_screen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _username;
  String _token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLoginDetail();
  }

  void loadLoginDetail() async {
    final SharedPreferences localdb = await SharedPreferences.getInstance();
    final String ldbUsername = localdb.getString('ldbUsername');
    final String ldbToken = localdb.getString('ldbToken');

    setState(() {
      _username = ldbUsername;
      _token = ldbToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You has been login as $_username'),
            Text('Your token is $_token'),
            AcwButton(
              title: 'Logout',
              colour: Colors.lightBlueAccent,
              onClick: () async {
                try {
                  await _logout();
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _logout() async {
    final SharedPreferences localdb = await SharedPreferences.getInstance();
    localdb.setString('ldbUsername', null);
    localdb.setString('ldbToken', null);

    Navigator.pushNamed(context, LoginScreen.id);
  }
}
