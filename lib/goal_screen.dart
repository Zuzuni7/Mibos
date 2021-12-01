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

  final BnameController = TextEditingController();
  final BdescController = TextEditingController();
  final BmTypeController = TextEditingController();
  final BmAmtController = TextEditingController();
  final BtypeController = TextEditingController();

  final SnameController = TextEditingController();
  final SdescController = TextEditingController();
  final SmTypeController = TextEditingController();
  final SmAmtController = TextEditingController();
  final StypeController = TextEditingController();

  String Mname = '';
  String Mdesc = '';
  static const String Mtype = 'mind';
  String MmAmt = '';
  String MmType = '';

  String Bname = '';
  String Bdesc = '';
  static const String Btype = 'body';
  String BmAmt = '';
  String BmType = '';

  String Sname = '';
  String Sdesc = '';
  static const String Stype = 'spirit';
  String SmAmt = '';
  String SmType = '';

  // // Not sure what this is for yet.
  // final Stream<QuerySnapshot> _usersStream =
  //     FirebaseFirestore.instance.collection('goals').snapshots();
  void parseDesc(String description) {
    print('parse through desc for name var');
    Mname = 'I am parsed now. woohoo.';
  }

  //Would the controllers go here? no bc here is a stateless widget.
  void updateDB() {
    setState(() {
      Mname = MnameController.text;
      Mdesc = MdescController.text;
      MmType = MmTypeController.text;
      MmAmt = MmAmtController.text;

      Bname = MnameController.text;
      Bdesc = MdescController.text;
      BmType = MmTypeController.text;
      BmAmt = MmAmtController.text;

      Sname = MnameController.text;
      Sdesc = MdescController.text;
      SmType = MmTypeController.text;
      SmAmt = MmAmtController.text;

      print('Debugging: ' + MmAmt + ' ' + MmType);
      print('Debugging: ' + BmAmt + ' ' + BmType);
      print('Debugging: ' + SmAmt + ' ' + SmType);
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
                decoration: InputDecoration(hintText: 'Mental Goal')),
          ),
          Container(
              child:
                  Text('Hint: use a short phrase like "Meditate for 5 min"')),
          Container(
            child: TextField(
                controller: BnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Body Goal')),
          ),
          Container(
              child: Text('Hint: use a short phrase like "Run for 10 min"')),
          Container(
            child: TextField(
                controller: SnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Spiritual Goal')),
          ),
          Container(
              child: Text('Hint: use a short phrase like "Pray 2 times"')),
          //add more here.................................................................
          Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.25 * 0.5),
              child: TextField(
                controller: MmAmtController,
                keyboardType: TextInputType.text,
                decoration:
                    InputDecoration(hintText: 'Distance/Time/Count (Mind)'),
              )),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.25 * 0.5),
              child: TextField(
                controller: BmAmtController,
                keyboardType: TextInputType.text,
                decoration:
                    InputDecoration(hintText: 'Distance/Time/Count (Body)'),
              )),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.25 * 0.5),
              child: TextField(
                controller: SmAmtController,
                keyboardType: TextInputType.text,
                decoration:
                    InputDecoration(hintText: 'Distance/Time/Count (Spirit)'),
              )),
          // Measure Amounts
          Container(),
          Container(),
          Container(),
        ]),
      ),
      bottomNavigationBar: Container(
        child: ElevatedButton(
          onPressed: () {
            updateDB();
            var collection = FirebaseFirestore.instance.collection('goals');
            collection
                .doc(
                    'dh2U5PjPbWGjKMkPaMqw') // <-- Doc ID where data should be updated.
                .update({'name': Mname});
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
