import 'package:firebase_testing/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'square_tile.dart';

class ThirdPartyAuth extends StatelessWidget {
  const ThirdPartyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SquareTile(
          imagePath: "lib/images/google.png",
          onTap: () => AuthServices().signInWithGoogle(),
        ),
      ],
    );
  }
}
