import 'package:firebase_auth/firebase_auth.dart';

/*
  FirebaseAuthService class
  set up firebase authentication service
 */
class FirebaseAuthService {
  final _authService = FirebaseAuth.instance;

  Stream<User> get currentUser => _authService.authStateChanges();
  Future<UserCredential> signInWithCredential(AuthCredential credential) => _authService.signInWithCredential(credential);
  Future<void> logout() => _authService.signOut();

}