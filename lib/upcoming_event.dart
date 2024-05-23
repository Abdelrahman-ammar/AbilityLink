import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ability_link1/notificationspage.dart';
import 'package:ability_link1/search.dart';
import 'package:ability_link1/attendevent.dart';
import 'package:ability_link1/utli/posts/eventpost.dart';

class Upcoming_Event extends StatelessWidget {
  Upcoming_Event({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 90, left: 20),
              child: const Text(
                'Upcoming Event',
                style: TextStyle(
                  color: Color(0xff12306C),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          bottom: AppBar(
            title: Row(
              children: [
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    child: const Text(
                      'Create Event',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AttendEvent(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 130,
                ),
              ],
            ),
          ),
        ),
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('event_info').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var event = snapshot.data!.docs[index];
                String title = event['title'];
                String government = event['government'];
                String date = event['date'];

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Event_Post(
                    title: title,
                    government: government,
                    date: date,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
