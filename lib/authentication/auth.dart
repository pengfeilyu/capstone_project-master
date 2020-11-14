import 'package:capstone_project/model/userprofileinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_auth_service.dart';

class Auth {
  final firebaseAuthService = FirebaseAuthService();
  final databaseReference = FirebaseDatabase.instance.reference();
  final facebookLogIn = FacebookLogin();
  final googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Stream<User> get currentUser => firebaseAuthService.currentUser;

  /*
    loginWithFacebook() func.
    1. facebookLogIn.logIn() - Allow user to sign in with Facebook
    2. FacebookAuthProvider.credential() - Get a credential from the FacebookLogIn object
    3. firebaseAuthService.signInWithCredential() - Authenticate with Firebase using the Firebase credential
   */
  loginWithFacebook() async {
    final facebooklogin_result = await facebookLogIn.logIn(
      permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ]
    );

    switch (facebooklogin_result.status) {
      case FacebookLoginStatus.Success:
        final AuthCredential credential = FacebookAuthProvider.credential(facebooklogin_result.accessToken.token);
        final userLoggedin = await firebaseAuthService.signInWithCredential(credential);

        final destination = databaseReference.child('User_List').child(userLoggedin.user.uid);
        destination.once().then(
                (DataSnapshot snapshot) {
                  print(snapshot.key);
              if (snapshot.value == null) {
                final new_user = UserProfileInfo(userName: userLoggedin.user.displayName, birthday: '', photoURL: userLoggedin.user.photoURL, aboutMe: '');
                destination.set(new_user.toJson());
                print('Create the new user profile');
              }
            }
        );
        print('The user: ${userLoggedin.user.displayName} has logged in with Facebook successfully');

        break;
      case FacebookLoginStatus.Cancel:
        print('The user canceled the login action');
        break;
      case FacebookLoginStatus.Error:
        print('Error while log in: ${facebooklogin_result.error}');
        break;
    }
  }

  /*
    signinWithGoogle() func.
    1. googleSignIn.signIn() - Allow user to sign in with Google
    2. GoogleAuthProvider.credential() - Get a credential from the GoogleSignIn object
    3. firebaseAuthService.signInWithCredential() - Authenticate with Firebase using the Firebase credential
   */
  signinWithGoogle() async {

    final GoogleSignInAccount gUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await gUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(idToken:googleAuth.idToken ,accessToken:googleAuth.accessToken );
    final userLoggedin = await firebaseAuthService.signInWithCredential(credential);

    final destination = databaseReference.child('User_List').child(userLoggedin.user.uid);
    destination.once().then(
            (DataSnapshot snapshot) {
              if (snapshot.value == null) {
                final new_user = UserProfileInfo(userName: userLoggedin.user.displayName, birthday: '', photoURL: userLoggedin.user.photoURL, aboutMe: '');
                destination.set(new_user.toJson());

                print('Create the new user profile');
              }
            }
    );
    print('The user: ${userLoggedin.user.displayName} has logged in with Google successfully');
  }

  logout() {
    firebaseAuthService.logout();
  }
}