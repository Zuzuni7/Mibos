import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mibos_app/button.dart';
import 'package:mibos_app/updateGoals.dart';
import 'package:mibos_app/mindCard.dart';
import 'package:mibos_app/spiritCard.dart';
import 'bodyCard.dart';
import 'avatar.dart';
import 'button.dart';
import 'progress.dart';
import 'globals.dart';

//Add Globals() here for mind,body,spirit percents

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = 'homescreen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var mindPercent = 0.0;
  var bodyPercent = 0.0;
  var spiritPercent = 0.0;
  var percent = 0.0;

  @override
  void initState() {
    setGlobals();
    setState(() {});
    super.initState();
  }

  // Set Globals through Globals custom class
  void setGlobals() async {
    mindPercent = await Globals().getMindPercent();
    bodyPercent = await Globals().getBodyPercent();
    spiritPercent = await Globals().getSpiritPercent();
    percent = await Globals().getPercent();
    print(mindPercent);
    print(bodyPercent);
    print(spiritPercent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MiBoS',
              style: TextStyle(
                  color: Colors.black, fontSize: 50, fontFamily: 'Genos')),
          textTheme: TextTheme(
              headline6: TextStyle(color: Colors.black, fontFamily: 'Genos')),
          leading: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Image.asset('assets/images/icon.png')),
          centerTitle: true,
          toolbarHeight: 150, // default is 56
          toolbarOpacity: 0.75,
          shadowColor: Colors.blue,
          backgroundColor: Colors.white,
          elevation: 10,
        ),
        body: ListView(
          //Maybe wrap this ListView in a Touch Area for progress update
          shrinkWrap: true,
          children: [
            MindCard(),
            BodyCard(),
            SpiritCard(),
            new ReportProgress(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EditGoals(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateGoals()))
                          .then((value) => initState());
                    },
                    child: Text('Update Goals Screen')),
                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         initState();
                //       });
                //     },
                //     child: Text('Refresh'))
              ],
            ),
          ],
          padding: EdgeInsets.all(20),
        ),
        backgroundColor: Colors.white,

        //The Avatar GIF needs to be extrapolated
        bottomNavigationBar: Container(
            height: 225,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                if (this.mindPercent > 0.75)
                  if (this.bodyPercent > 0.75)
                    if (this.spiritPercent > 0.75)
                      Avatar('assets/images/avatar111.gif')
                    else
                      Avatar('assets/images/avatar110.gif')
                  else if (this.spiritPercent > 0.75)
                    Avatar('assets/images/avatar101.gif')
                  else
                    Avatar('assets/images/avatar100.gif')
                else if (this.bodyPercent > 0.75)
                  if (this.spiritPercent > 0.75)
                    Avatar('assets/images/avatar011.gif')
                  else
                    Avatar('assets/images/avatar010.gif')
                else if (this.spiritPercent > 0.75)
                  Avatar('assets/images/avatar001.gif')
                else
                  Avatar('assets/images/avatar000.gif')
              ],
            )));
  }
}
