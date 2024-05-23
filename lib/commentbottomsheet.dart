import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Comment_bottom_sheet extends StatelessWidget {
  final String postId;

  const Comment_bottom_sheet({required this.postId});

  @override
  Widget build(BuildContext context) {
    String commentText = '';

    return Card(
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerRight,
                width: 270,
                child: TextField(
                  onChanged: (value) {
                    commentText = value;
                  },
                  decoration: InputDecoration(
                    hintText: "write a comment",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: RotatedBox(
                quarterTurns: 180,
                child: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.blue,
                    size: 30,
                  ),
                  onPressed: () async {
                    if (commentText.isNotEmpty) {
                      // Store comment in Firestore
                      await FirebaseFirestore.instance
                          .collection('comments')
                          .add({
                        'postId': postId,
                        'commentText': commentText,
                        // Add other relevant fields like userId if needed
                      });
                      // Close the bottom sheet after adding the comment
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
