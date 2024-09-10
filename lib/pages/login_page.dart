import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_testing/components/3rd_party_auth.dart';
import 'package:firebase_testing/components/my_button.dart';
import 'package:firebase_testing/components/my_texfield.dart';
import 'package:firebase_testing/services/regex_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // form
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  // sign user in method
  void signUserIn() async {
    // show loading circly
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    // try sign in
    try {
      if (_loginFormKey.currentState!.validate()) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      }
      // pop the loading indicator
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      // pop the loading indicator
      if (mounted) {
        Navigator.pop(context);
      }
      showErrorMessage(e.code);
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: Text(message));
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Icon(
                  Icons.lock,
                  size: 100,
                ),
              ),

              // welcome back
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Welcome back you've been missed!",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              ),

              Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    // email textfield
                    MyTextField(
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false,
                      textInputType: TextInputType.emailAddress,
                      validationFunction: (value) {
                        if (!RegexService().isEmail(value)) {
                          return "This is not a valid email address";
                        }
                        return null;
                      },
                    ),

                    // password textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true,
                    ),
                  ],
                ),
              ),

              // forgot password
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 27.0, vertical: 5.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),

              // sign in button
              MyButton(
                onTap: signUserIn,
                buttonText: "Sign in",
              ),

              // or connect via
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                        child:
                            Divider(thickness: 0.5, color: Colors.grey[400])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Or continue with",
                          style: TextStyle(color: Colors.grey[700])),
                    ),
                    Expanded(
                        child:
                            Divider(thickness: 0.5, color: Colors.grey[400])),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // google sign in
              const ThirdPartyAuth(),

              const SizedBox(
                height: 25,
              ),

              // register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  TextButton(
                      onPressed: widget.onTap,
                      child: const Text(
                        "Register now",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
