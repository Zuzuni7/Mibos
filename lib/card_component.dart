import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'goal.dart';

class CardComponent extends StatefulWidget {
  const CardComponent({Key? key}) : super(key: key);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<CardComponent> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["goals"];
    });
  }

  Future<void> EditGoals() async {
    //navigate to Edit goals screen
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      alignment: Alignment.topCenter,
      height: 275,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          ElevatedButton(
            child: const Text('Edit Goals'),
            onPressed: EditGoals,
          ),
          // Display the data loaded from sample.json
          _items.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: Text(_items[index]["id"]),
                          title: Text(_items[index]["name"]),
                          subtitle: Text(_items[index]["details"]),
                        ),
                      );
                    },
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
