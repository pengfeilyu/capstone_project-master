import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'authentication/auth.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  /*
    initState() func.
    Check if the user is currently signed in:
    1. if Yes, display user profile
    2. if No, move back to Login page
   */
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage())
        );
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    var auth_service = Provider.of<Auth>(context);

    return Scaffold(
        body: Center(
          child: StreamBuilder<User> (
              stream: auth_service.currentUser,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data.photoURL),
                        radius: 70.0,
                      ),
                      Text(
                        '\n${snapshot.data.displayName}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Text(
                        '\n${snapshot.data.email}\n',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                      ),
                      SizedBox(height: 20,),
                      SignInButton(
                          Buttons.Google,
                          text: 'Sign Out of Google',
                          onPressed: () => auth_service.logout()
                      ),
                      SignInButton(
                          Buttons.Facebook,
                          text: 'Log Out of Facebook',
                          onPressed: () => auth_service.logout()
                      )
                    ],
                  );
                }
              }
          ),
        )
    );
  }
}