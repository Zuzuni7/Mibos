import 'package:flutter/material.dart';
import 'package:mibos_app/home_screen.dart';
import 'goal_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'updateGoals.dart';
import 'globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await extractData();
  runApp(MyApp());
}

//String docID = 'dh2U5PjPbWGjKMkPaMqw';

// //Map<String, dynamic> data = .data()! as Map<String, dynamic>;
// final data = firestore.collection('percents').doc('percentageCalcs').get();

extractData() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final data =
      await firestore.collection('percents').doc('percentageCalcs').get();

  var percent = Globals().getPercent();
  var currMmAmt = Globals().getCurrMmAmt();
  var currBmAmt = Globals().getCurrBmAmt();
  var currSmAmt = Globals().getCurrSmAmt();

  var mindPercent = Globals().getMindPercent();
  var bodyPercent = Globals().getBodyPercent();
  var spiritPercent = Globals().getSpiritPercent();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Genos'),
      home: HomePage(),
      initialRoute: ',',
      routes: {
        GoalsScreen.routeName: (ctx) => GoalsScreen(),
        UpdateGoals.routeName: (ctx) => UpdateGoals()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
