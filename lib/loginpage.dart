import 'package:capstone_project/profilepage.dart';
import 'package:capstone_project/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'authentication/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  /*
    initState() func.
    Check if the user is currently signed in:
    1. if Yes, move to Home page
    2. if No, ask user to log in
   */
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user != null) {
        print('Move to profile page');
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())
        );
      }
    });

    super.initState();
  }

  // UI Layout - Login page
  Widget build(BuildContext context) {
    var auth = Provider.of<Auth>(context);
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                  Buttons.Google,
                  onPressed: () => auth.signinWithGoogle()
              ),
              SizedBox(height: 10,),
              SignInButton(
                  Buttons.Facebook,
                  onPressed: () => auth.loginWithFacebook()
              )
            ],
          ),
        )
    );
  }
}
