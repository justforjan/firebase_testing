import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;

  const MyButton({super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 10.0),
    //   child: GestureDetector(
    //     onTap: onTap,
    //     child: Container(
    //         padding: const EdgeInsets.all(20),
    //         margin: const EdgeInsets.symmetric(horizontal: 25),
    //         decoration: BoxDecoration(
    //             color: Theme.of(context).colorScheme.primary,
    //             borderRadius: BorderRadius.circular(8)),
    //         child: Center(
    //           child: Text(
    //             buttonText,
    //             style: TextStyle(
    //                 color: Theme.of(context).colorScheme.onPrimary,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 16),
    //           ),
    //         )),
    //   ),
    // );

    return FilledButton(
      onPressed: onTap,
      child: Text(buttonText),
      style: ButtonStyle(),
    );
  }
}
