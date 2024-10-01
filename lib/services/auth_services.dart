import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  // signInWithGoogle_web() async {
  //   final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
  //   return await FirebaseAuth.instance.signInWithProvider(googleAuthProvider);
  // }

  AuthServices() {
    user = _auth.currentUser;
  }

  User? getCurrentUser() {
    return user;
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await _auth.signInWithCredential(credential);
  }

  updateDisplayName(String displayName) {
    if (user != null) {
      user!.updateDisplayName(displayName);
    }
  }

  createUserWithEmailAndPassword(
      String email, String password, String displayName) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    updateDisplayName(displayName);
  }

  signInWithEmailAndPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  signUserOut() {
    _auth.signOut();
  }

  String getCurrentUserID() {
    return _auth.currentUser!.uid;
  }
}
