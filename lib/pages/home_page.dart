import 'package:firebase_testing/components/app_bar.dart';
import 'package:firebase_testing/components/group_card.dart';
import 'package:firebase_testing/components/helper_components.dart'
    show addVerticalSpace;
import 'package:firebase_testing/components/my_button.dart';
import 'package:firebase_testing/models/group.dart';
import 'package:firebase_testing/pages/create_group.dart';
import 'package:firebase_testing/services/expense_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Your Groups",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GroupCard(
                    group: Group(
                  name: "Albanien",
                  id: 1,
                  saldo: 5.6,
                )),
                // Divider(),
                GroupCard(
                    group: Group(
                  name: "Marokko",
                  id: 2,
                  saldo: -78.0,
                )),
                addVerticalSpace(5),
                MyButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateGroup()),
                      );
                    },
                    buttonText: "Create Group"),
                addVerticalSpace(5),
                MyButton(
                    onTap: ExpenseServices().joinGroup,
                    buttonText: "Join Group"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
