import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ability_link1/default%20text%20field.dart';
import 'package:ability_link1/Date_Piker.dart';
import 'package:ability_link1/Time_pick.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttendEvent extends StatefulWidget {
  AttendEvent({Key? key}) : super(key: key);

  @override
  _AttendEventState createState() => _AttendEventState();
}

class _AttendEventState extends State<AttendEvent> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController governmentController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController placeNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String fromTime = ''; // Variable to hold the "from" time
  String toTime = '';

  void addToFirestore(String fromTime, String toTime) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    String title = titleController.text;
    String government = governmentController.text;
    String street = streetController.text;
    String placeName = placeNameController.text;
    String date = dateController.text;

    String description = descriptionController.text;

    firestore.collection('event_info').add({
      'title': title,
      'government': government,
      'street': street,
      'placeName': placeName,
      'date': date,
      'description': description,
      'fromTime': fromTime,
      'toTime': toTime,
      'created_at': FieldValue.serverTimestamp(),
    }).then((value) {
      print('Data added to Firestore');
    }).catchError((error) {
      print('Failed to add data to Firestore: $error');
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          " Event Information",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(right: 200, left: 20),
          child: Text(
            'Event Title',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 40,
            width: 392,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: sqrt1_2, color: Colors.blue),
            ),
            child: DefaultTextField(
              controller: titleController,
              keyboardtype: TextInputType.text,
              labletext: "Enter Here",
              fillcolor: const Color.fromARGB(255, 229, 229, 229),
              weight: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 200, left: 20, top: 20),
          child: Text(
            'Government',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 40,
            width: 392,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: sqrt1_2, color: Colors.blue),
            ),
            child: DefaultTextField(
              controller: governmentController,
              keyboardtype: TextInputType.text,
              labletext: "Enter Here",
              fillcolor: const Color.fromARGB(255, 229, 229, 229),
              weight: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 200, left: 20, top: 20),
          child: Text(
            'Street',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 40,
            width: 392,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: sqrt1_2, color: Colors.blue),
            ),
            child: DefaultTextField(
              controller: streetController,
              keyboardtype: TextInputType.text,
              labletext: "Enter Here",
              fillcolor: const Color.fromARGB(255, 229, 229, 229),
              weight: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 200, left: 20, top: 20),
          child: Text(
            'PlaceName',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 40,
            width: 392,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: sqrt1_2, color: Colors.blue),
            ),
            child: DefaultTextField(
              controller: placeNameController,
              keyboardtype: TextInputType.text,
              labletext: "Enter Here",
              fillcolor: const Color.fromARGB(255, 229, 229, 229),
              weight: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 200, left: 20, top: 20),
          child: Text(
            'Date',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 40,
            width: 392,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: sqrt1_2, color: Colors.blue),
            ),
            child: DefaultTextField(
              controller: dateController,
              keyboardtype: TextInputType.text,
              labletext: "month/day",
              fillcolor: const Color.fromARGB(255, 229, 229, 229),
              weight: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 200, left: 20, top: 20),
          child: Text(
            'Description',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 40,
            width: 392,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: sqrt1_2, color: Colors.blue),
            ),
            child: DefaultTextField(
              controller: descriptionController,
              keyboardtype: TextInputType.emailAddress,
              labletext: "Enter Here",
              fillcolor: const Color.fromARGB(255, 229, 229, 229),
              weight: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: [
              PickTime(
                onTimeSelected: (selectedFromTime, selectedToTime) {
                  setState(() {
                    fromTime = selectedFromTime;
                    toTime = selectedToTime;
                  });
                },
              ),
            ],
          ),
        ),
        // Column(
        //   children: [
        //     const Padding(
        //       padding: EdgeInsets.only(right: 290, left: 20),
        //       child: Text(
        //         'Privacy',
        //         style: TextStyle(color: Colors.black, fontSize: 20),
        //       ),
        //     ),
        //     Padding(
        //         padding: const EdgeInsets.only(right: 20, left: 20),
        //         child: Row(children: [
        //           ElevatedButton(
        //             onPressed: () {},
        //             child: Row(
        //               children: [
        //                 Text(
        //                   "Public",
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //                 SizedBox(
        //                   width: 10,
        //                 ),
        //                 Icon(
        //                   Icons.public,
        //                   color: Colors.white,
        //                 )
        //               ],
        //             ),
        //             style: ButtonStyle(backgroundColor:
        //                 MaterialStateColor.resolveWith(
        //                     (Set<MaterialState> states) {
        //               if (states.contains(MaterialState.pressed)) {
        //                 return Colors.grey;
        //               }
        //               return Colors.blue;
        //             })),
        //           ),
        //           SizedBox(
        //             width: 80,
        //           ),
        //           ElevatedButton(
        //             onPressed: () {},
        //             child: Row(
        //               children: [
        //                 Text(
        //                   "Private",
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //                 SizedBox(
        //                   width: 1,
        //                 ),
        //                 Icon(
        //                   Icons.private_connectivity_rounded,
        //                   size: 30,
        //                   color: Colors.white,
        //                 )
        //               ],
        //             ),
        //             style: ButtonStyle(backgroundColor:
        //                 MaterialStateColor.resolveWith(
        //                     (Set<MaterialState> states) {
        //               if (states.contains(MaterialState.pressed)) {
        //                 return Colors.grey;
        //               }
        //               return Colors.blue;
        //             })),
        //           ),
        //         ]))
        //   ],
        // ),
        Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Container(
              width: 400,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue,
              ),
              child: TextButton(
                onPressed: () {
                  // Call addToFirestore with both "from" and "to" times
                  addToFirestore(fromTime, toTime);
                },
                child: const Text(
                  'Save Edit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 20),
                ),
              ),
            )),
      ]));
}
