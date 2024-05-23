import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chat_bottom_sheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors
              .white, 
        ),
        child: Row(children: [
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.attachment_outlined))),
          Padding(
              padding: EdgeInsets.only(left: 30),
              child: Container(
                alignment: Alignment.centerRight,
                width: 200,
                child: TextField(
                  onSubmitted: (data) {},
                  decoration: InputDecoration(
                    hintText: "write your message",
                    border: InputBorder.none,
                  ),
                ),
              )),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RotatedBox(
              quarterTurns: 180,
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.blue,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
          )
        ]));
  }
}
