import 'package:ability_link1/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'guidelins_page.dart';
import 'notificationspage.dart';
import 'search.dart';
import 'utli/posts/userposts.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
   String fullName = CachHelper.getFirstName();
   String email = CachHelper.getEmail();
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {

      String? Email = CachHelper.getEmail();
      // String uid = FirebaseAuth.instance.currentUser!.uid;
      // DocumentSnapshot<Map<String, dynamic>> snapshot =
          // await FirebaseFirestore.instance.collection('users').doc(uid).get();
      // if (snapshot.exists) {
        // setState(() {
          // fullName = snapshot.data()!['full_name'];
        // });
      // }
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  String timeAgoSinceDate(int? dateTime) {
    final now = DateTime.now();
    final date = DateTime.fromMillisecondsSinceEpoch(dateTime! * 1000);
    final difference = now.difference(date);

    if (difference.inSeconds < 5) {
      return 'just now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      final weeks = difference.inDays ~/ 7;
      return '$weeks weeks ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Discover',
          style: TextStyle(
            color: Color(0xff344054),
            fontSize: Checkbox.width,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.end,
        ),
        actions: <Widget>[
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: IconButton(
              padding: const EdgeInsets.all(3),
              icon: const Icon(
                Icons.auto_stories_outlined,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Guide_Lines())),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 30.0,
            height: 30.0,
            transformAlignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child: IconButton(
              padding: const EdgeInsets.all(3),
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Search())),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 30.0,
            height: 30.0,
            alignment: Alignment.center,
            transformAlignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(3),
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Notification_page())),
                ),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      border: Border.all(color: Colors.white, width: 1)),
                ),
              ],
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No posts available'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              Timestamp timestamp = data['timestamp'] as Timestamp;
              String formattedTime = timeAgoSinceDate(timestamp.seconds);
              String name = data["username"];
              return UserPosts(
                name,
                formattedTime,
                data['post_text'],
                true,
                document.id, //post id
                data['image_url'], // Passing the image URL directly
              );
            },
          );
        },
      ),
    );
  }
}

