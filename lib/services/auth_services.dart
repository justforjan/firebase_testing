import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // signInWithGoogle_web() async {
  //   final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
  //   return await FirebaseAuth.instance.signInWithProvider(googleAuthProvider);
  // }

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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  createUserWithEmailAndPassword(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  signInWithEmailAndPassword(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  String getCurrentUserID() {
    return auth.currentUser!.uid;
  }
}
