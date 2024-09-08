import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_testing/components/my_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser!;

  HomePage({super.key});

  // sign user out
  void signUserOut() {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("LOGGED IN AS: ${user!.email!}"),
      ),
    );
  }
}
