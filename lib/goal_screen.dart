import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'form.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);
  static const routeName = '/goals_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Goals"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        color: Colors.white10,
        alignment: Alignment.topCenter,
        child: ListView(children: [DropDownMenu(),DropDownMenu(),DropDownMenu()]),
      ),
      bottomNavigationBar: Container(
        child: ElevatedButton(
          onPressed: () {
            // saveData('1', 'study', 'mind', 'Study Flutter for 10 min',
            //     'min', '10'); //UpdateJSON
            Navigator.pop(context);
          },
          child: Text('Scoobity bop!'),
        ),
      ),
    );
  }
}
