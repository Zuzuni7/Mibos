import 'package:flutter/material.dart';

class BodyGoal extends StatefulWidget {
  //const UserInput({Key? key}) : super(key: key);

  @override
  _BodyGoal createState() => _BodyGoal();
}

class _BodyGoal extends State<BodyGoal> {
  final BnameController = TextEditingController();
  final BdescController = TextEditingController();
  final BmTypeController = TextEditingController();
  final BmAmtController = TextEditingController();
  final BtypeController = TextEditingController();

  String name = '';
  String desc = '';
  String type = '';
  String mAmt = '';
  String mType = '';

  String get BGname => name;

  void update() {
    setState(() {
      name = BnameController.text;
      desc = BdescController.text;
      mType = BmTypeController.text;
      mAmt = BmAmtController.text;
      type = BtypeController.text;

      print(name);
      print(desc);
      print(mType);
      print(mAmt);
      print(type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
          controller: BnameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: 'Body Goal')),
    );
  }
}
