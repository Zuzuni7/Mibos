import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class GoalsScreen extends StatefulWidget {
  //const UserInput({Key? key}) : super(key: key);
  static const routeName = '/goals_screen';
  @override
  _GoalsScreen createState() => _GoalsScreen();
}

class _GoalsScreen extends State<GoalsScreen> {
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

  // Not sure what this is for yet.
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('goals').snapshots();

  //Would the controllers go here? no bc here is a stateless widget.
  void updateDB() {
    setState(() {
      name = MnameController.text;
      // desc = MdescController.text;
      // mType = MmTypeController.text;
      // mAmt = MmAmtController.text;
      // type = MtypeController.text;

      print(name);
    });
  }

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
        child:
            ListView(padding: EdgeInsets.all(30), shrinkWrap: true, children: [
          Container(
            child: TextField(
                controller: MnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Mind Goal')),
          ),
          Container(
            child: TextField(
                //controller: BnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Body Goal')),
          ),
          Container(
            child: TextField(
                //controller: SnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Spirit Goal')),
          )
        ]),
      ),
      bottomNavigationBar: Container(
        child: ElevatedButton(
          onPressed: () {
            // call function that updates Firebase.
            // Do I need to refresh the instance?
            updateDB();
            var collection = FirebaseFirestore.instance.collection('goals');
            collection
                .doc(
                    'dh2U5PjPbWGjKMkPaMqw') // <-- Doc ID where data should be updated.
                .update({'name': name});
            print("Collection: " + collection.id);
            Navigator.pop(context);
          },
          child: Text('Submit Changes', style: TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}

// This class is supposed to be for formatting the form entry but I might delete it later...
class EditGoalsHeader extends StatelessWidget {
  const EditGoalsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(""),
      padding: EdgeInsets.all(30),
    );
  }
}
