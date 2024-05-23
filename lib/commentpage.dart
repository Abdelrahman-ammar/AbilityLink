import 'package:flutter/material.dart';
import 'package:ability_link1/commentbottomsheet.dart';
import 'package:ability_link1/comments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class comment_page extends StatefulWidget {
  final String postId;

  const comment_page({required this.postId});

  @override
  _comment_pageState createState() => _comment_pageState();
}

class _comment_pageState extends State<comment_page> {
  TextEditingController _commentController = TextEditingController();

  void _addComment(String postId, String commentText) {
    // Add the comment to Firestore collection
    FirebaseFirestore.instance.collection('comments').add({
      'postId': postId,
      'commentText': commentText,
      // Add any additional fields like user ID, timestamp, etc.
    }).then((value) {
      // Reset the comment text field after successfully adding the comment
      _commentController.clear();
    }).catchError((error) {
      // Handle error if comment addition fails
      print('Failed to add comment: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Your app bar configuration
          ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('comments')
                  .where('postId', isEqualTo: widget.postId)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No comments available'));
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    final postId = data['postId'] as String?;
                    return Comment(
                      name: data['username'] ?? '',
                      time: data['timestamp'] ?? '',
                      title: data['commentText'] ?? '',
                      postId: postId ?? '', // Add null-check here
                    );
                  }).toList(),
                );
              },
            ),
          ),
          CommentInputField(
            commentController: _commentController,
            onCommentSubmitted: (commentText) {
              _addComment(widget.postId, commentText);
            },
          ),
        ],
      ),
    );
  }
}

class CommentInputField extends StatelessWidget {
  final TextEditingController commentController;
  final Function(String) onCommentSubmitted;

  const CommentInputField({
    Key? key,
    required this.commentController,
    required this.onCommentSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: 'Write a comment...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (commentController.text.isNotEmpty) {
                onCommentSubmitted(commentController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
