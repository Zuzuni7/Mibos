import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);
  static const routeName = '/goals_screen';

  // This function is supposed to update the JSON
  Future<void> saveData(String id, String name, String type, String details,
      String mType, String mAmt) async {
    //Update JSON
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    File jsonFile = File("data.json");
    // CANT FIND THIS DIR!!!!!!!!!!!!!!!!!!
    data["goals"][1]["id"] = "1";
    data["goals"][1]["name"] = "study";
    data["goals"][1]["type"] = "mind";
    data["goals"][1]["details"] = "Study for 10 minute";
    data["goals"][1]["mType"] = "min";
    data["goals"][1]["mAmt"] = "10";

    print(data["goals"][1]);

    jsonFile.writeAsStringSync(json.encode(data));
  }

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
                saveData('1', 'study', 'mind', 'Study Flutter for 10 min',
                    'min', '10'); //UpdateJSON
                //Navigator.pop(context);
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
