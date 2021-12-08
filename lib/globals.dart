import 'package:cloud_firestore/cloud_firestore.dart';

// double percent = 0.0;
// double currMmAmt = 5;
// double currBmAmt = 5;
// double currSmAmt = 5;
// double mindPercent = 0.2;
// double bodyPercent = 0.2;
// double spiritPercent = 0.2;

/**
 * This class of global variables is to make it
 * possible to read and write to firebase without
 * having multiple instances of firebase running
 * and making requests. 
 */
class Globals {
  Globals(
      {this.percent: 0,
      this.currMmAmt: 0,
      this.currBmAmt: 0,
      this.currSmAmt: 0,
      this.mindPercent: 0,
      this.bodyPercent: 0,
      this.spiritPercent: 0});

  double percent;
  double currMmAmt;
  double currBmAmt;
  double currSmAmt;
  double mindPercent;
  double bodyPercent;
  double spiritPercent;

  // Asynchronous named arugments function that sets the values of the global
  // Named arguments allow you to specify which variable you are passing into
  // this function. I can pass all the variables or just set one.
  // This would be a better way to do what is being done with the goals dataset
  /// For the time being I will do that here.

  void setGlobals(
      {percent,
      currMmAmt,
      currBmAmt,
      currSmAmt,
      mindPercent,
      bodyPercent,
      spiritPercent}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (percent != null) {
      percent = this.percent;
    }

    if (currMmAmt != null) {
      currMmAmt = this.currMmAmt;
    }
    if (currBmAmt != null) {
      currBmAmt = this.currBmAmt;
    }
    if (currSmAmt != null) {
      currSmAmt = this.currSmAmt;
    }
    //NOTE TO SELF: CONTINUE WITH REMAINING VARS
    if (mindPercent) {
      mindPercent = this.mindPercent;
    }
    if (bodyPercent) {
      bodyPercent = this.bodyPercent;
    }
    if (spiritPercent) {
      spiritPercent = this.spiritPercent;
    }
  }

  Future<double> getPercent() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final data =
        await firestore.collection('percents').doc('percentageCalcs').get();
    percent = data['percent'];
    return percent;
  }

  Future<double> getCurrBmAmt() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final data =
        await firestore.collection('percents').doc('percentageCalcs').get();
    currBmAmt = data['currBmAmt'];
    return currBmAmt;
  }

  Future<double> getCurrMmAmt() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final data =
        await firestore.collection('percents').doc('percentageCalcs').get();
    currMmAmt = data['currMmAmt'];
    return currMmAmt;
  }

  Future<double> getCurrSmAmt() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final data =
        await firestore.collection('percents').doc('percentageCalcs').get();
    currSmAmt = data['currSmAmt'];
    return currSmAmt;
  }

  Future<double> getMindPercent() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final data =
        await firestore.collection('percents').doc('percentageCalcs').get();
    mindPercent = data['mindPercent'];
    return mindPercent;
  }

  Future<double> getBodyPercent() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final data =
        await firestore.collection('percents').doc('percentageCalcs').get();
    bodyPercent = data['bodyPercent'];
    return bodyPercent;
  }

  Future<double> getSpiritPercent() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final data =
        await firestore.collection('percents').doc('percentageCalcs').get();
    spiritPercent = data['spiritPercent'];
    return spiritPercent;
  }
}
