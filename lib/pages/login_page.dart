import 'package:firebase_testing/components/my_button.dart';
import 'package:firebase_testing/components/my_texfield.dart';
import 'package:firebase_testing/components/square_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              // welcome back
              Text(
                "Welcome back you've been missed!",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),
              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: "Username",
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
              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // sign in button
              MyButton(
                onTap: signUserIn,
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: "lib/images/google.png"),
                ],
              ),

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
                      onPressed: () {},
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
