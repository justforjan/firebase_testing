import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_testing/components/3rd_party_auth.dart';
import 'package:firebase_testing/components/my_button.dart';
import 'package:firebase_testing/components/my_texfield.dart';
import 'package:firebase_testing/services/regex_service.dart';
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

  // Form necessities
  final _registerFormKey = GlobalKey<FormState>();

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
      if (_registerFormKey.currentState!.validate()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
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

  String? passwordsMatch(String? value) {
    if (passwordController.text != confirmPasswordController.text) {
      return "Passwords do not match";
    }
    return null;
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
              // email textfield
              Form(
                key: _registerFormKey,
                child: Column(
                  children: [
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
                      validationFunction: passwordsMatch,
                    ),

                    // confirm password textfield
                    MyTextField(
                      controller: confirmPasswordController,
                      hintText: "Password",
                      obscureText: true,
                      validationFunction: passwordsMatch,
                    ),

                    // sign in button
                    MyButton(
                      onTap: signUserUp,
                      buttonText: "Sign up",
                    ),
                  ],
                ),
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
