import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ability_link1/commentbottomsheetrReply.dart';

class Comment extends StatelessWidget {
  final String name;
  final String time;
  final String title;
  final String postId; // Add postId parameter

  const Comment({
    required this.name,
    required this.time,
    required this.title,
    required this.postId, // Add postId parameter
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 12, left: 12, right: 0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/Image.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 200, left: 20),
                              child: Text(
                                name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 150),
                              child: Text(
                                time,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 0),
                      Icon(
                        Icons.more_horiz,
                        color: Color(0xff667085),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 210, top: 10),
                  child: Text(
                    title,
                    style: TextStyle(color: Color(0xff667085)),
                  ),
                ),
                SizedBox(width: 50),
                Padding(
                  padding: EdgeInsets.only(right: 280, top: 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Comment_bottom_sheet_Reply(postId: postId),
                      ));
                    },
                    child: Text(
                      'Reply',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xff667085),
                  thickness: 1.0,
                  height: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
