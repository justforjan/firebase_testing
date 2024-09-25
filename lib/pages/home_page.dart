import 'package:firebase_testing/components/app_bar.dart';
import 'package:firebase_testing/components/group_card.dart';
import 'package:firebase_testing/components/helper_components.dart'
    show addVerticalSpace;
import 'package:firebase_testing/components/my_button.dart';
import 'package:firebase_testing/models/group.dart';
import 'package:firebase_testing/pages/create_group.dart';
import 'package:firebase_testing/services/database_services.dart';
import 'package:firebase_testing/services/expense_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseServices _dbServices = DatabaseServices();

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
                  total: 5.6,
                )),
                // Divider(),
                GroupCard(
                    group: Group(
                  name: "Marokko",
                  total: -78.0,
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
