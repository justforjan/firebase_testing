import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_testing/pages/create_group.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  final String title;

  MyAppBar({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(title,
          style: const TextStyle(
            color: Colors.white,
          )),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateGroup()),
              );
            },
            icon: const Icon(
              Icons.group_add,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget get child => this;
}
