import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_testing/components/3rd_party_auth.dart';
import 'package:firebase_testing/components/my_button.dart';
import 'package:firebase_testing/components/my_texfield.dart';
import 'package:firebase_testing/components/square_tile.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user in method
  void signUserUp() async {
    // show loading circly
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    // try sign up
    try {
      // check if password in confirmed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        showErrorMessage("Passwords not not match");
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
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        print("user not found");
        showErrorMessage("user not found");
      }
      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        print("wrong password");
        showErrorMessage("wrong password");
      }
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
              const SizedBox(
                height: 50,
              ),
              // logo
              const Icon(
                Icons.lock,
                size: 50,
              ),
              const SizedBox(
                height: 50,
              ),
              // let's create an acount for you
              Text(
                "Let's create an account for you!",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),
              // username textfield
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              // confirm password textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              // sign in button
              MyButton(
                onTap: signUserUp,
                buttonText: "Sign up",
              ),
              const SizedBox(
                height: 25,
              ),

              // or connect via
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  TextButton(
                      onPressed: widget.onTap,
                      child: const Text(
                        "Login now",
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
