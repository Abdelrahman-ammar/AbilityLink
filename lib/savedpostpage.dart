import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ability_link1/commentpage.dart';

class SavedPostpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Posts'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('saved')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('user_saved_posts') // Corrected collection name
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final savedPosts = snapshot.data!.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();

          if (savedPosts.isEmpty) {
            return Center(child: Text('No saved posts found.'));
          }

          return SingleChildScrollView(
            child: Column(
              children: savedPosts.map((post) {
                return PostCard(
                  name: post['name'] ?? 'Anonymous',
                  time: post['formattedTime'] ?? '',
                  title: post['title'] ?? '',
                  isOnline: post['isOnline'] ?? false,
                  postId: post['postId'] ?? '',
                  imageUrl: post['imageUrl'] ?? 'assets/images/userpost2.png',
                  liked: post['liked'] ?? 0,
                  commentCount: post['commentCount'] ?? 0,
                  onPressed: () => _removePostFromSaved(post['postId']),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  Future<void> _removePostFromSaved(String postId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final savedRef = FirebaseFirestore.instance
          .collection('saved')
          .doc(currentUser.uid)
          .collection('user_saved_posts') // Corrected collection name
          .doc(postId);

      await savedRef.delete();
      print('Post removed from saved.');
    }
  }
}

class PostCard extends StatelessWidget {
  final String name;
  final String time;
  final String title;
  final bool isOnline;
  final String postId;
  final String imageUrl;
  final int liked;
  final int commentCount;
  final VoidCallback onPressed;

  PostCard({
    required this.name,
    required this.time,
    required this.title,
    required this.isOnline,
    required this.postId,
    required this.imageUrl,
    required this.liked,
    required this.commentCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/Group 9204.png",
                      ),
                      radius: 25,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 6.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        height: 11,
                        width: 11,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  isOnline ? Colors.greenAccent : Colors.grey,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            height: 7,
                            width: 7,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 8,
              right: 20,
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xff667085),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 280,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: liked > 0 ? Colors.red : Color(0xff667085),
                  onPressed: () {
                    // Increment 'liked' value and update in Firestore
                    print('love');
                  },
                ),
                Spacer(),
                IconButton(
                  icon: Icon(FontAwesomeIcons.comment),
                  color: Color(0xff667085),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => comment_page(postId: postId),
                    ),
                  ),
                ),
                Text(
                  '$commentCount',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.bookmark_border),
                  color: Color.fromARGB(255, 50, 102, 214),
                  onPressed: onPressed, // Invoke onPressed callback
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xff667085),
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
