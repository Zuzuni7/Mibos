import 'package:flutter/material.dart';
import 'package:mibos_app/home_screen.dart';
import 'goal_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'updateGoals.dart';
import 'globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await extractData();
  runApp(MyApp());
}

// Don't know why I made this function.
// extractData() async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final data =
//       await firestore.collection('percents').doc('percentageCalcs').get();

//   var percent = Globals().getPercent();
//   var currMmAmt = Globals().getCurrMmAmt();
//   var currBmAmt = Globals().getCurrBmAmt();
//   var currSmAmt = Globals().getCurrSmAmt();

//   var mindPercent = Globals().getMindPercent();
//   var bodyPercent = Globals().getBodyPercent();
//   var spiritPercent = Globals().getSpiritPercent();
//   print(currBmAmt);
//   print(currMmAmt);
//   print(currSmAmt);
// }

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
        UpdateGoals.routeName: (ctx) => UpdateGoals(),
        HomePage.routeName: (ctx) => HomePage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
