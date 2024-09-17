import 'package:firebase_testing/components/app_bar.dart';
import 'package:firebase_testing/components/helper_components.dart';
import 'package:firebase_testing/components/my_button.dart';
import 'package:firebase_testing/components/my_texfield.dart';
import 'package:firebase_testing/services/expense_services.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  TextEditingController groupNameController = TextEditingController();

  final GlobalKey<FormState> _createGroupFormKey = GlobalKey<FormState>();

  void createGroup() {
    try {
      if (_createGroupFormKey.currentState!.validate()) {
        ExpenseServices().createGroup();
        Navigator.pop(context);
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "Create Group",
        ),
        body: SafeArea(
          child: Form(
            key: _createGroupFormKey,
            child: Column(
              children: [
                addVerticalSpace(20),
                MyTextField(
                    controller: groupNameController,
                    hintText: "Group name",
                    validationFunction: (value) {
                      if (value == null || value == "") {
                        return "Group name must not be empty";
                      }
                      return null;
                    }),
                addVerticalSpace(10),
                MyButton(onTap: createGroup, buttonText: "Create Group")
              ],
            ),
          ),
        ));
  }
}
