import 'package:flutter/material.dart';

class MindGoal extends StatefulWidget {
  //const UserInput({Key? key}) : super(key: key);

  @override
  _MindGoal createState() => _MindGoal();
}

class _MindGoal extends State<MindGoal> {
  final MnameController = TextEditingController();
  final MdescController = TextEditingController();
  final MmTypeController = TextEditingController();
  final MmAmtController = TextEditingController();
  final MtypeController = TextEditingController();

  String name = '';
  String desc = '';
  String type = '';
  String mAmt = '';
  String mType = '';

  void update() {
    setState(() {
      name = MnameController.text;
      desc = MdescController.text;
      mType = MmTypeController.text;
      mAmt = MmAmtController.text;
      type = MtypeController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
          controller: MnameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: 'Mental Goal')),
    );
  }
}

/**
 * Things to do by Saturday:
 * 
 * 1. Study Controllers
 * 2. Passing data using controllers
 * 3. Update Firebase
 */