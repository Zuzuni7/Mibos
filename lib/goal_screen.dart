import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
final fb =
    FirebaseFirestore.instance.collection('goals').doc(docID).snapshots();

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

  static const String Btype = 'body';
  static const String Mtype = 'mind';
  static const String Stype = 'spirit';

  String Mname = '';
  String Mdesc = '';
  String MmAmt = '10';
  String MmType = '';
  String Bname = '';
  String Bdesc = '';
  String BmAmt = '4';
  String BmType = '';
  String Sname = '';
  String Sdesc = '';
  String SmAmt = '7';
  String SmType = '';

  void calcPercent() {
    mindPercent = currMmAmt / double.parse(this.SmAmt);
    bodyPercent = currBmAmt / double.parse(this.BmAmt);
    spiritPercent = currSmAmt / double.parse(this.MmAmt);
    percent = (mindPercent + bodyPercent + spiritPercent) / 3;
  }

  // // Not sure what this is for yet.
  // final Stream<QuerySnapshot> _usersStream =
  //     FirebaseFirestore.instance.collection('goals').snapshots();
  void parseDesc(String description) {
    var name;

    for (int i = 0; i < description.length; i++) {
      if (description[i + 1] == ' ') {
        Mname = name;
        return name;
      } else {
        name = description[i] + description[i + 1];
        //print('CHAR_________: ' + char);
      }
    }
  }

  //Would the controllers go here? no bc here is a stateless widget.
  void updateDB() {
    setState(() {
      Mname = MnameController.text;
      Mdesc = MdescController.text;
      MmType = MmTypeController.text;
      MmAmt = MmAmtController.text;

      Bname = BnameController.text;
      Bdesc = BdescController.text;
      BmType = BmTypeController.text;
      BmAmt = BmAmtController.text;

      Sname = SnameController.text;
      Sdesc = SdescController.text;
      SmType = SmTypeController.text;
      SmAmt = SmAmtController.text;

      var snapshot1 = firestore.collection('goals').doc(docID).update({
        'body': [Bname, Bdesc, BmType, BmAmt, 'body'],
      });
      var snapshot2 = firestore.collection('goals').doc(docID).update({
        'mind': [Mname, Mdesc, MmType, MmAmt, 'mind'],
      });
      var snapshot3 = firestore.collection('goals').doc(docID).update({
        'spirit': [Sname, Sdesc, SmType, SmAmt, 'spirit'],
      });
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
                controller: MdescController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Mental Goal')),
          ),
          Container(
              child:
                  Text('Hint: use a short phrase like "Meditate for 5 min"')),
          Container(
            child: TextField(
                controller: BdescController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Body Goal')),
          ),
          Container(
              child: Text('Hint: use a short phrase like "Run for 10 min"')),
          Container(
            child: TextField(
                controller: SdescController,
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
                decoration: InputDecoration(
                    hintText: 'Amount of times, mins, hours, etc (Mind)'),
              )),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.25 * 0.5),
              child: TextField(
                controller: BmAmtController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Amount of times, mins, hours, etc (Body)'),
              )),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.25 * 0.5),
              child: TextField(
                controller: SmAmtController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Amount of times, mins, hours, etc (Spirit)'),
              )),
          // Measure Types
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.50 * 0.75),
              child: TextField(
                controller: MmTypeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText:
                        'Measurement type eg., min, hours, times, etc... (Mind)'),
              )),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.50 * 0.75),
              child: TextField(
                controller: BmTypeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText:
                        'Measurement type eg., min, hours, times, etc... (Body)'),
              )),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.50 * 0.75),
              child: TextField(
                controller: SmTypeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText:
                        'Measurement type eg., min, hours, times, etc... (Spirit)'),
              )),
        ]),
      ),
      bottomNavigationBar: Container(
        child: ElevatedButton(
          onPressed: () {
            parseDesc(Mdesc);
            parseDesc(Bdesc);
            parseDesc(Sdesc);
            calcPercent();
            updateDB();
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
