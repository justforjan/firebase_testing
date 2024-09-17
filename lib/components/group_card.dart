import 'package:flutter/material.dart';
import 'package:firebase_testing/components/helper_components.dart'
    show addVerticalSpace;

class Group extends StatelessWidget {
  final String groupName;
  final double saldo;
  final int groupID;

  const Group(
      {super.key,
      required this.groupName,
      required this.saldo,
      required this.groupID});

  void openGroup() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addVerticalSpace(5),
        Card(
          child: ListTile(
            onTap: openGroup,
            leading: const Icon(Icons.group),
            title: Text(groupName),
            subtitle: Text(
              saldo.toString(),
              style: TextStyle(color: saldo < 0 ? Colors.red : Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}
