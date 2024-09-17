import 'package:firebase_testing/models/group.dart';
import 'package:flutter/material.dart';
import 'package:firebase_testing/components/helper_components.dart'
    show addVerticalSpace;

class GroupCard extends StatelessWidget {
  final Group group;

  const GroupCard({super.key, required this.group});

  void openGroup() {}

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      addVerticalSpace(5),
      Card(
        child: ListTile(
          onTap: openGroup,
          leading: const Icon(Icons.group),
          title: Text(group.name),
          subtitle: RichText(
            text: TextSpan(
              text: "Your balance: ",
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: group.saldo.toString(),
                  style: TextStyle(
                      color: group.saldo < 0 ? Colors.red : Colors.green),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
