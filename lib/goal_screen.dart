import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);
  static const routeName = '/goals_screen';

  Future<void> saveData() async {
    //Update JSON
  }

// Future function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Goals"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white10,
          alignment: Alignment.topCenter,
          child: Container(
            child: ElevatedButton(
              onPressed: () {
                saveData(); //UpdateJSON
                Navigator.pop(context);
              },
              child: Text('Update Goals'),
            ),
          ),
        ));
  }
}

class GoalsForm extends StatefulWidget {
  const GoalsForm(String name, String details, String mType, int mAmt,
      {Key? key})
      : super(key: key);

  final String name = '';
  final String details = '';
  final String mType = '';
  final int mAmt = 0;

  @override
  _GoalsFormState createState() => _GoalsFormState();
}

class _GoalsFormState extends State<GoalsForm> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["goals"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GoalsForm('Pray', 'Pray 2 times', 'times', 2),
    );
  }
}
