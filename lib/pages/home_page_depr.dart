import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class HomePageDepr extends StatefulWidget {
  const HomePageDepr({super.key});

  @override
  State<HomePageDepr> createState() => _HomePageDeprState();
}

class _HomePageDeprState extends State<HomePageDepr> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Google SignIn")),
        body: _user != null ? _userInfo() : loginPage());
  }

  Widget loginPage() {
    return Center(
      child: Column(
        children: [
          // const Image(image: AssetImage('assets/logo.png')),
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      hintText: "Enter your email address"))),
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    hintText: "Enter your password"),
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child:
                ElevatedButton(onPressed: () {}, child: const Text("Log in")),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child:
                  TextButton(onPressed: () {}, child: const Text("Register"))),
          _googleSignInButton()
        ],
      ),
    );
  }

  Widget _googleSignInButton() {
    return Center(
        child: SizedBox(
            height: 50,
            child: SignInButton(Buttons.google,
                text: "Sign up with Google", onPressed: _handleGoogleSignIn)));
  }

  Widget _userInfo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(_user!.photoURL!))),
          ),
          Text(_user!.email!),
          Text(_user!.displayName ?? ""),
          MaterialButton(
            color: Colors.red,
            onPressed: _auth.signOut,
            child: const Text("Sign Out"),
          )
        ],
      ),
    );
  }

  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      print(error);
    }
  }
}
