import 'package:flutter/material.dart';

class SpiritGoal extends StatefulWidget {
  //const UserInput({Key? key}) : super(key: key);

  @override
  _SpiritGoal createState() => _SpiritGoal();
}

class _SpiritGoal extends State<SpiritGoal> {
  final SnameController = TextEditingController();
  final SdescController = TextEditingController();
  final SmTypeController = TextEditingController();
  final SmAmtController = TextEditingController();
  final StypeController = TextEditingController();

  String name = '';
  String desc = '';
  String type = '';
  String mAmt = '';
  String mType = '';

  void update() {
    setState(() {
      name = SnameController.text;
      desc = SdescController.text;
      mType = SmTypeController.text;
      mAmt = SmAmtController.text;
      type = StypeController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
          controller: SnameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: 'Spirit Goal')),
    );
  }
}
