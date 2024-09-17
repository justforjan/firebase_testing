import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_testing/components/app_bar.dart';
import 'package:firebase_testing/components/group_card.dart';
import 'package:firebase_testing/components/helper_components.dart'
    show addVerticalSpace;
import 'package:firebase_testing/services/auth_services.dart';
import 'package:firebase_testing/services/expense_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  void createGroup() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Your Groups",
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Group(
                  groupName: "Albanien",
                  groupID: 1,
                  saldo: 5.6,
                ),
                // Divider(),
                Group(
                  groupName: "Marokko",
                  groupID: 2,
                  saldo: -78.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
