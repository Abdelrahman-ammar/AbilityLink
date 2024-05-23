import 'package:ability_link1/doctor_details.dart';
import 'package:ability_link1/default text field.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

import 'package:flutter/material.dart';

class SearchDoctor extends StatelessWidget {
  SearchDoctor();

  var SearchController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctor",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                  child: DefaultTextField(
                    controller: SearchController1,
                    keyboardtype: TextInputType.text,
                    labletext: "Search by name",
                    prefixicon: Icons.search,
                    weight: double.infinity,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc('BafSg4C1zRTGrDsan4lZDJdFxpt1')
                        .collection('doctors')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Column(
                          children: List.generate(snapshot.data!.docs.length, (index) {
                            var doctor = snapshot.data!.docs[index];
                            // Check if the field exists
                            if (doctor.data().containsKey('job_title')) {
                              return Container(
                                width: double.infinity,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 231, 230, 230),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(70),
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/msdoctor.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              doctor['full_name'],
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 0, 0, 0),
                                              ),
                                            ),
                                            Text(
                                              doctor['job_title'],
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff858585),
                                              ),
                                            ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => DoctorDetails(documentId: doctor.id),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: Color(0xff0072F9),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "View",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Icon(
                                                  Icons.star,
                                                  size: 30,
                                                  color: Color(0xffF89603),
                                                ),
                                                Text(
                                                  "5.0", // This should be dynamic from Firestore
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(255, 0, 0, 0),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return SizedBox(); // Return an empty SizedBox if the field doesn't exist
                            }
                          }),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
