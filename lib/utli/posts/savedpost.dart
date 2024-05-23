import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ability_link1/commentpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef SavedCallback = void Function(bool saved);

class Saved_Post extends StatelessWidget {
  Saved_Post(this.postId, this.onSavedChanged);
  final String postId;
  final SavedCallback onSavedChanged;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('saved')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('posts')
          .doc(postId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Center(child: Text('Post not found.'));
        }

        final post = snapshot.data!.data() as Map<String, dynamic>;

        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 325,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0, top: 0),
                      child: Row(
                        children: [
                          Stack(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/Group 9204.png"),
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
                                        color: post['isOnline']
                                            ? Colors.greenAccent
                                            : Colors.grey,
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
                            children: [
                              Text(
                                post['name'] ?? 'Anonymous',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                post['time'] ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      post['title'] ?? '',
                      style: TextStyle(
                        color: Color(0xff667085),
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(width: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Container(
                        height: 185,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: NetworkImage(post['imageUrl'] ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, top: 10, bottom: 0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            color: post['liked'] > 0
                                ? Colors.red
                                : Color(0xff667085),
                            onPressed: () {
                              // Handle 'like' functionality
                              print('love');
                            },
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.comment),
                            color: Color(0xff667085),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    comment_page(postId: postId),
                              ),
                            ),
                          ),
                          Text(
                            '${post['commentCount'] ?? 0}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(width: 100),
                          IconButton(
                            icon: Icon(Icons.bookmark_border),
                            color: post['saved'] ?? false
                                ? Colors.blue
                                : Color.fromARGB(255, 50, 102, 214),
                            onPressed: () {
                              // Handle 'saved' functionality
                              _toggleSaved(postId, post['saved'] ?? false)
                                  .then((_) {
                                onSavedChanged(!(post['saved'] ?? false));
                              });
                            },
                          ),
                          SizedBox(width: 20),
                          Icon(
                            FontAwesomeIcons.share,
                            color: Color(0xff667085),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xff667085),
                      thickness: BorderSide.strokeAlignCenter,
                      height: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _toggleSaved(String postId, bool isSaved) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final savedRef = FirebaseFirestore.instance
          .collection('saved')
          .doc(currentUser.uid)
          .collection('posts')
          .doc(postId);

      if (isSaved) {
        await savedRef.delete();
        print('Post removed from saved.');
      } else {
        await savedRef.set({
          'postId': postId,
          // Add other fields if needed
        });
        print('Post saved.');
      }
    }
  }
}
