import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

// Stream collectionStream =
//     FirebaseFirestore.instance.collection('goals').snapshots();
// Stream documentStream = FirebaseFirestore.instance
//     .collection('goals')
//     .doc('dh2U5PjPbWGjKMkPaMqw')
//     .snapshots();

class SpiritCard extends StatefulWidget {
  const SpiritCard({Key? key}) : super(key: key);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<SpiritCard> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('goals').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['spirit'][1]),
              subtitle: Text(data['spirit'][0]),
              leading: Text(data['spirit'][4]),
              trailing: Text(
                  data['spirit'][3] + ' ' + data['spirit'][2] + 'remaining'),
            );
          }).toList(),
        );
      },
    );
  }
}




// ElevatedButton(
//             child: const Text('Edit Goals'),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => GoalsScreen()),
//               );
//             },
//           ),