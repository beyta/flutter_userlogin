import 'package:flutter/material.dart';
import 'package:flutteruserlogin/screen/dashboard_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutteruserlogin/styles/styles.dart';
import 'package:flutteruserlogin/components/acwButton.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool showSpinner = false;
  }

  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _username = value;
                },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Username'
                  )
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  _password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Password (can skip for this demo)'
                )
              ),
              SizedBox(
                height: 8.0,
              ),
              AcwButton(
                title: 'Login',
                colour: Colors.lightBlueAccent,
                onClick: () async {
                  setState(() {
                    showSpinner=true;
                  });

                  try {
                    await _submitLogin(_username, _password);
                    showSpinner = false;
                  } catch (e) {
                    print(e);
                    setState(() {
                      showSpinner = false;
                    });
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<Null> _submitLogin(String username, String password) async {
    //call your api here.

    //Assume your API return success
    if (username != null) {
      final SharedPreferences localdb = await SharedPreferences.getInstance();
      localdb.setString('ldbUsername', username);
      localdb.setString('ldbToken', 'random token word you generate');

      print (username);
      setState(() {
        isLoggedIn = true;
      });

      if (isLoggedIn == true){
        Navigator.pushNamed(context, DashboardScreen.id);
      }
    }
    else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

}
