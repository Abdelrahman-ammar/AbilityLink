import 'package:flutter/material.dart';
import 'package:ability_link1/commentpage.dart';

class Comment_bottom_sheet_Reply extends StatelessWidget {
  final String postId;

  const Comment_bottom_sheet_Reply({required this.postId});

  @override
  Widget build(BuildContext context) {
    String replyText = '';

    return Card(
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70, right: 380),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  size: 35,
                  color: Colors.blue,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 270,
                    child: TextField(
                      onChanged: (value) {
                        replyText = value;
                      },
                      decoration: InputDecoration(
                        hintText: "write a Reply",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: RotatedBox(
                    quarterTurns: 180,
                    child: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                        size: 30,
                      ),
                      onPressed: () async {
                        if (replyText.isNotEmpty) {
                          // Store reply logic can be added here if needed
                          // For simplicity, we're just closing the bottom sheet
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
